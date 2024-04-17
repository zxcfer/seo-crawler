import scrapy
from searchengine.items import UrlItem, UrlStatusItem, UrlAlertItem

import django
django.setup()
from applications.front.models import Website

# cuida la Identacion, porque puede que te salga un error
class SiteMapSpider(scrapy.Spider):
    name = "sitemapcrawler"
    start_urls = []

    def __init__(self):
        websites = Website.objects.filter(status=Website.WEBSITE_ACTIVE)
        for x in websites:
            self.start_urls.append(x.root_url+'sitemap.xml')

    def parse(self, response):
        if True:
            self.alert(response.url, 103)
            
        url = UrlItem()
        url['url'] = response.url
        url['urltype'] = 0
        url['website'] = self.get_website(response.url)
        url = url.save()

        # creamos el detalle de Url
        urlStatus = UrlStatusItem()
        urlStatus.save()

            
