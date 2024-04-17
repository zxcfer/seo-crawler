import datetime
import scrapy
from searchengine.spiders.SeoBaseSpider import SeoBaseSpider
from scrapy.contrib.linkextractors.lxmlhtml import LxmlLinkExtractor
from scrapy.log import INFO
from scrapy import signals
from scrapy.xlib.pydispatch import dispatcher
from scrapy.linkextractor import IGNORED_EXTENSIONS

import django

django.setup()
from applications.front.models import Website, UrlStatus, Url, Crawl, Image

# 1) the broken link, 
# 2) the page, and 
# 3) the anchor text

class SeoSpider(SeoBaseSpider):
    today = datetime.date.today()
    name = "seocrawler"
    start_urls = []
    allowed_domains = []
    url = None
    errors_4xx = [400,401,402,403,404,405,406,407,408,
                  409,410,411,412,413,414,415,416,417]
    errors_5xx = [501,502,503,504,505]
    redirects_30x = [301,302]
    handle_httpstatus_list = errors_4xx + errors_5xx + redirects_30x
    queue = []
    website = None
    
    def __init__(self):
        dispatcher.connect(self.on_spider_closed, signals.spider_closed)

    def start_requests(self):
        # check if a crawler is running, if yes return empty
        if not Website.objects.filter(status=Website.WEBSITE_RUNNING):
            website = Website.objects.filter(deleted_at__isnull=True)\
                .filter(status=Website.WEBSITE_ACTIVE)\
                .order_by('updated_at')[:1]
            
            if website:
                self.website = website[0]
                self.website.status = Website.WEBSITE_RUNNING
                self.website.save()
                crawl = Crawl(website=self.website)
                crawl.notes = self.website.name+"|"+self.website.root_url
                crawl.save()
                
                request = scrapy.Request(url=self.website.root_url, dont_filter=True)
                request.meta['crawl_id'] = crawl.id
                return [request]

        return []

    def on_spider_closed(self, spider, reason):
        if self.website:
            self.website.status = Website.WEBSITE_ACTIVE
            self.website.save()

    def download_file(self, response):
        """Save images to disk"""
        filename = self.get_the_filename(response.url)
        f = open("D:/tmp/" + filename, 'wb')
        f.write(response.body)

    def get_the_filename(self, url):
        return url.split('?')[0].split('/')[-1]
    
    def get_the_extension(self, url):
        return self.get_the_filename(url).split('.')[-1]
    
    def parse(self, response):
        crawl_id = response.meta['crawl_id']
        crawl = Crawl.objects.get(pk=crawl_id)
        url = self.getOrCreateUrl(response.url, crawl)

        urlStatuses = UrlStatus.objects.filter(url=url, crawl=crawl)
        if urlStatuses:
            self.log("== duplicated URL <{0}>".format(url.url), INFO)
            return

        urlStatus = self.newUrlStatus(response, crawl, url)

        if self.errorOrRedirect(response, crawl, url, urlStatus):
            return
        
        # Do not parse images, pdfs and other non-html files
        # content_type = response.headers.get('Content-Type')
        if self.get_the_extension(response.url) in IGNORED_EXTENSIONS:
            # if content_type != 'str: text/html':
            return

        self.parse_vip(response, url, urlStatus, crawl)
        urlStatus.save()
        
        domains = [self.get_domain(response.url)] # filter internal links only
        
        links = []
        lle = LxmlLinkExtractor(deny_extensions=[], allow_domains=domains)
        for link in lle.extract_links(response):
            if link.url not in self.queue:
                if len(links) > self.max_urls():
                    break
                links.append(link.url)
                self.queue.append(link.url)
        
        for link in links:
            # if not UrlStatus.objects.filter(url__url=link.url, crawl=crawl):
            request = scrapy.Request(link, callback=self.parse) #dont_filter=True
            request.meta['crawl_id'] = crawl.id
            yield request
            
    def max_urls(self):
        if self.website.max_urls == 0:
            return 50000
        elif self.website.max_urls == 2:
            return 5000
        elif self.website.max_urls == 3:
            return 10000
        else:
            return 10000
        
    def parse_vip(self, response, url, urlStatus, crawl):
        prevUrlStatus = None
        try:
            previous_crawl = Crawl.objects \
                .exclude(worked_on=self.today) \
                .filter(website=url.website) \
                .latest('worked_on')
            prevUrlStatus = UrlStatus.objects.get(url=url, crawl=previous_crawl)
        except:
            self.log('== This is the first crawl, no previous ones.', INFO)
        
        urlStatus = self.structured_data(response, url, urlStatus, crawl)
        
        robots = self.robots(response, url, crawl, prevUrlStatus)
        images = self.images(response, urlStatus, url, crawl)
        
        urlStatus.meta_keywords = self.keywords(response, urlStatus, url, crawl, prevUrlStatus)
        urlStatus.twitter = self.twitter(response)
        urlStatus.facebook = self.facebook(response, url, crawl, urlStatus, prevUrlStatus)
        urlStatus.images = images['images']
        urlStatus.no_alt_images = images['no_alt_images']
        urlStatus.title = self.title(response, urlStatus, url, crawl, prevUrlStatus)
        urlStatus.meta_desc = self.meta_desc(response, urlStatus, url, crawl, prevUrlStatus)
        urlStatus.h1 = self.h1(response, urlStatus, url, crawl, prevUrlStatus)
        urlStatus.pagination = self.pagination(response, url, crawl, prevUrlStatus)
        urlStatus.canonical = self.canonical(response, url, crawl, prevUrlStatus)
        urlStatus.robots_follow = robots['follow']
        urlStatus.robots_index = robots['index']
        urlStatus.robots_noindex = robots['noindex']
        urlStatus.robots_nofollow = robots['nofollow']
        urlStatus.robots_noarchive = robots['noarchive']
        urlStatus.robots_nosnippet= robots['nosnippet']
        urlStatus.robots_noodp = robots['noodp']
        urlStatus.robots_noydir = robots['noydir']
        urlStatus.redirect = self.redirect(response, url, crawl, prevUrlStatus)
        urlStatus.save()
        
        self.log('== parse finished', INFO)

    def setUrlShort(self, url):
        if not url.url_short:
            if '?' in url.url:
                url.url_short = url.url.split('?')[0]
            else:
                url.url_short = url.url
            url.save()


    def getOrCreateUrl(self, url_str, crawl):
        url, created = Url.objects.get_or_create(
            url=url_str,
            website=crawl.website,
            defaults={'type':1})
        
        self.setUrlShort(url)
        
        if created:
            self.alert(url, crawl, 902) # New URL registered
            
        return url

    def errorOrRedirect(self, response, crawl, url, urlStatus):
    # return if 4xx or 5xx Errors
        if response.status in self.handle_httpstatus_list:
            if response.status in self.errors_5xx:
                self.alert(url, crawl, 905)
            if response.status in self.errors_4xx:
                self.alert(url, crawl, 904)
            if response.status in self.redirects_30x:
                print "aqui"
            self.log("Error <{0}:{1}>".format(url.url, response.status), INFO)
            urlStatus.save()
            return True
        else:
            return False

    def newUrlStatus(self, response, crawl, url):
        urlStatus = UrlStatus(url=url, 
            crawl=crawl, 
            url_status_code=response.status)
        urlStatus.depth = response.meta["depth"]
        urlStatus.referer = response.request.headers.get('Referer', None)
        urlStatus.save()
        return urlStatus

    def check_parameters(self, response, url, crawl):
        ''' checks if there are params in URL detection'''
        if '?' in response.url:
            self.alert(url, crawl, 901)

    def images(self, response, urlStatus, url, crawl):
        imgs = response.css('img')
        
        if imgs:
            alt = imgs.xpath('@alt').extract()
        else:
            alt = []

        for img in imgs:
            image_src = img.xpath('@src').extract()[0]
            image_alt = img.xpath('@alt').extract()
            if image_alt:
                image_alt = image_alt[0]
            else:
                image_alt = None
            image = Image(url_status=urlStatus,
                          src=image_src, 
                          alt=image_alt)
            image.save()

        return {'images':len(imgs),
                'no_alt_images':(len(imgs) - len(alt))}

    def parse_normal(self, response):
        pass

    def title_already_exists(self, url, crawl, title):
        urlStatus = UrlStatus.objects.filter(crawl=crawl, title=title)
        if urlStatus:
            self.alert(url, crawl, 102) # duplicate
            if not len(urlStatus) > 1:
                self.alert(urlStatus[0].url, crawl, 102) # duplicate
    
    def title(self, response, urlStatus, url, crawl, prevUrlStatus):
        title = response.css('head title::text').extract()
        if title:
            if len(title) > 1:
                self.alert(url, crawl, 103) # multiple
                title = "|".join([t.strip() for t in title])
            else:
                title = title[0].strip()
                if len(title) > 65: 
                    self.alert(url, crawl, 104) # Over 65 characters
                if len(title) <= 30:
                    self.alert(url, crawl, 105) # Below 30 characters
            self.title_already_exists(url, crawl, title)
        else:
            title = None
            self.alert(url, crawl, 101) # Missing

        if prevUrlStatus and prevUrlStatus.title != title:
            self.alert(url, crawl, 106) # Changed

        return title

    # self.alert(url, crawl, 602) # duplicate
    def keywords(self, response, urlStatus, url, crawl, prevUrlStatus):
        '''<meta name="keywords" content="HTML, CSS, XML, XHTML, JavaScript">'''
        keywords = None
        keywords_tag = response.xpath('//meta[@name="keywords"]')
        if keywords_tag:
            if len(keywords_tag) > 1:
                self.alert(url, crawl, 603) # multiple
            else:
                content = keywords_tag.xpath('@content').extract()
                if content:
                    keywords = content[0].strip()
                else:
                    self.alert(url, crawl, 601) # missing content
        else:
            self.alert(url, crawl, 601) # missing

        return keywords
    
    def structured_data(self, response, url, urlStatus, crawl):
        '''
        itemtype="http://schema.org/Product"
        itemtype="http://schema.org/Offer"
        itemtype="http://schema.org/AggregateRating"
        itemtype="http://schema.org/Review"
        itemtype="http://schema.org/Rating"
        '''
        prod = response.xpath('//*[@itemtype="http://schema.org/Product"]')
        offer = response.xpath('//*[@itemtype="http://schema.org/Offer"]')
        aggreg = response.xpath('//*[@itemtype="http://schema.org/AggregateRating"]')
        review = response.xpath('//*[@itemtype="http://schema.org/Review"]')
        rating = response.xpath('//*[@itemtype="http://schema.org/Rating"]')
        
        if len(prod) > 0:
            urlStatus.struct_product = len(prod)
        if len(offer) > 0:
            urlStatus.struct_offer = len(offer)
        if len(aggreg) > 0:
            urlStatus.struct_aggreg = len(aggreg)
        if len(review) > 0:
            urlStatus.struct_review = len(review)
        if len(rating) > 0:
            urlStatus.struct_rating= len(rating)

        return urlStatus

    def robots(self, response, url, crawl, prevUrlStatus):
        # <meta name="robots" content="noindex, nofollow">
        robots = {'index':None,
                  'follow':None,
                  'nofollow':None,
                  'noindex':None,
                  'noarchive':None,
                  'nosnippet':None,
                  'noodp':None,
                  'noydir':None,}
        robots_tag = response.xpath('//meta[@name="robots"]')
        if robots_tag:
            content = robots_tag.xpath("@content").extract()
            if content:
                items = content[0].split(',')
                for item in items:
                    if item.strip().lower() == 'nofollow':
                        robots['nofollow'] = 1
                    if item.strip().lower() == 'noindex':
                        robots['noindex'] = 1
                    if item.strip().lower() == 'index':
                        robots['index'] = 1
                    if item.strip().lower() == 'follow':
                        robots['follow'] = 1
                    if item.strip().lower() == 'noarchive':
                        robots['noarchive'] = 1
                    if item.strip().lower() == 'nosnippet':
                        robots['nosnippet'] = 1
                    if item.strip().lower() == 'noodp':
                        robots['noodp'] = 1
                    if item.strip().lower() == 'noydir':
                        robots['noydir'] = 1
        else:
            # self.alert(url, crawl, 701) # There is no robots meta tag
            pass
#         if prevUrlStatus and (prevUrlStatus.robots_index != robots['index']
#                 and prevUrlStatus.robots_follow != robots['follow']
#                 and prevUrlStatus.robots_noindex != robots['noindex']
#                 and prevUrlStatus.robots_nofollow != robots['nofollow']):
#             self.alert(url, crawl, 705) # robots changed 

        return robots

    def meta_desc_already_exists(self, url, crawl, meta_desc):
        urlStatus = UrlStatus.objects.filter(crawl=crawl, meta_desc=meta_desc)
        if urlStatus:
            self.alert(url, crawl, 302) # duplicate
            if not len(urlStatus) > 1:
                self.alert(urlStatus[0].url, crawl, 302) # duplicate

    def meta_desc(self, response, urlStatus, url, crawl, prevUrlStatus):
        '''<meta name="description" content="Example of a meta desc...">'''
        meta_desc = None
        meta_desc_tag = response.xpath('//meta[@name="description"]')
        if meta_desc_tag:
            if len(meta_desc_tag) > 1:
                self.alert(url, crawl, 303) # multiple
            else:
                content = meta_desc_tag.xpath('@content').extract()
                if content:
                    meta_desc = content[0].strip()
                    self.meta_desc_already_exists(url, crawl, meta_desc)
                    if len(meta_desc) > 156:
                        self.alert(url, crawl, 304) # Over 150 characters
                    if len(meta_desc) < 70:
                        self.alert(url, crawl, 305) # Below 70 characters
                else:
                    self.alert(url, crawl, 306) # missing content
        else:
            self.alert(url, crawl, 301) # missing

        if prevUrlStatus and prevUrlStatus.meta_desc != meta_desc:
            # self.alert(url, crawl, 307) # changed
            pass

        return meta_desc
    
    def h1_already_exists(self, url, crawl, h1):
        urlStatus = UrlStatus.objects.filter(crawl=crawl, h1=h1)
        if urlStatus:
            self.alert(url, crawl, 202) # duplicate
            if not len(urlStatus) > 1:
                self.alert(urlStatus[0].url, crawl, 202) # duplicate
    
    def h1(self, response, urlStatus, url, crawl, prevUrlStatus):
        h1 = response.css('h1')
        if h1:
            h1 = h1.xpath('string()').extract()
            if len(h1) > 1:
                self.alert(url, crawl, 203) # multiple
                
            h1 = h1[0].strip()
            self.h1_already_exists(url, crawl, h1)
        else:
            h1 = None
            self.alert(url, crawl, 201) # missing

        if prevUrlStatus and prevUrlStatus.h1 != h1:
            self.alert(url, crawl, 204) # change

        return h1

    def canonical(self, response, url, crawl, prevUrlStatus):
        '''<link rel="canonical" href="https://moz.com/researchtools/ose/" />'''
        canonical = response.xpath('//head/link[@rel="canonical"]')
        if canonical:
            canonical = canonical.xpath('@href').extract()
            if canonical:
                canonical = canonical[0].strip()
            else:
                canonical = ''
        else:
            canonical = None
            # self.alert(url, crawl, 401) # Missing canonical meta tag
            pass

        if prevUrlStatus and prevUrlStatus.canonical != canonical:
            self.alert(url, crawl, 403)

        return canonical

    
    def redirect(self, response, url, crawl, prevUrlStatus):
        # <meta http-equiv="refresh" content="0; url=http://example.com/" />
        redirect = None
        redirect_tag = response.selector.xpath('//meta[@http-equiv="refresh"]')
        if redirect_tag:
            if len(redirect_tag) > 1:
                self.alert(url, crawl, 802) # More than one robots tag
            else:
                content = redirect_tag.xpath("@content").extract()
                if content:
                    content_url = content[0].split('url=')
                    if 1 in content_url:
                        redirect = content[1]
                else:
                    self.alert(url, crawl, 804) # No content for robots
        else:
            # self.alert(url, crawl, 801) # There is no redirect tag
            pass
            
        if prevUrlStatus and prevUrlStatus.redirect != redirect:
            self.alert(url, crawl, 803) # Redirect URL changed

        return redirect

    def pagination(self, response, url, crawl, prevUrlStatus):
        # rel=next and rel=prev in the <head>)
        next_pag = response.xpath('//head/link[@rel="next"]')
        prev_pag = response.xpath('//head/link[@rel="prev"]')
        if next_pag:
            pagination = next_pag.xpath('@href').extract()
            if pagination:
                pagination = pagination[0].strip()
            else:
                pagination = ''
        elif prev_pag:
            pagination = prev_pag.xpath('@href').extract()
            if pagination:
                pagination = pagination[0].strip()
            else:
                pagination = ''
        else:
            pagination = None

        if prevUrlStatus and prevUrlStatus.pagination != pagination:
            self.alert(url, crawl, 503) # changed

        return pagination
    
    def twitter(self, response):
        '''
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:site" content="@flickr" />
        <meta name="twitter:title" content="Small Island ..." />
        <meta name="twitter:description" content="View the album on Flickr." />
        <meta name="twitter:image" content="https://farm6..../95258ff_z.jpg" />
        '''
        card = response.xpath('//meta[@property="og:title"]')
        site = response.xpath('//meta[@property="og:type"]')
        title = response.xpath('//meta[@property="og:url"]')
        desc = response.xpath('//meta[@property="og:url"]')
        image = response.xpath('//meta[@property="og:image"]')
        if card and site and title and image and desc:
            return 0 # complete
        elif not (card and site and title and image and desc):
            return 1 # missing
        else:
            return 2 # incomplete

    def facebook(self, response, url, crawl, urlStatus, prevUrlStatus):
        '''http://ogp.me/
        <meta property="og:title" content="The Rock" />
        <meta property="og:type" content="video.movie" />
        <meta property="og:url" content="http://www.imdb.com/title/tt0117500/" />
        <meta property="og:image" content="http://ia.mdb.com/images/rock.jpg" />
        '''
        facebook = {}
        og_title = response.xpath('//meta[@property="og:title"]')
        og_type = response.xpath('//meta[@property="og:type"]')
        og_url = response.xpath('//meta[@property="og:url"]')
        og_image = response.xpath('//meta[@property="og:image"]')
        if og_title and og_type and og_url and og_image:
            og_title = og_title.xpath("@content").extract()
            og_type = og_type.xpath("@content").extract()
            og_url = og_url.xpath("@content").extract()
            og_image = og_image.xpath("@content").extract()

            facebook['og_title'] = self.get_first_or_none(og_title)
            facebook['og_type'] = self.get_first_or_none(og_type)
            facebook['og_url'] = self.get_first_or_none(og_url)
            facebook['og_image'] = self.get_first_or_none(og_image)

        if prevUrlStatus and not (prevUrlStatus.og_title == urlStatus.og_title
                and prevUrlStatus.og_type == urlStatus.og_type
                and prevUrlStatus.og_url == urlStatus.og_url
                and prevUrlStatus.og_image == urlStatus.og_image):
            self.alert(url, crawl, 2003) # changed

        if og_title and og_type and og_url and og_image:
            return 0 # complete
        elif not (og_title and og_type and og_url and og_image):
            return 1 # missing
        else:
            return 2 # incomplete
    
    def get_first_or_none(self, items):
        if items:
            return items[0]
        else:
            return None