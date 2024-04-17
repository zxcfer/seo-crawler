import scrapy
from searchengine.items import UrlAlertItem

import django
from django.db.models import Q
from applications.front.models import Website, Alert

django.setup()

class SeoBaseSpider(scrapy.Spider):

    def alert(self, url, crawl, alert_code, param=''):
        urlAlert = UrlAlertItem()
        urlAlert['alert'] = Alert.objects.get(pk=alert_code)
        urlAlert['url'] = url
        urlAlert['crawl'] = crawl
        urlAlert.save()

    def parse(self):
        pass
    
    def get_domain(self, url):
        if '://' in url:
            return url.split('://')[1].split('/')[0]
        else:
            return url.split('/')[0]

    def get_website(self, url):
        website = Website.objects.filter(root_url=url)
        if website:
            return website[0];
        else:
            if url.startswith('http://'):
                base_url = 'http://'
                domain = url.replace(base_url, '').split('/')[0]
    
            elif url.startswith('https://'):
                base_url = 'https://'
                domain = url.replace(base_url, '').split('/')[0]
    
            weburl = base_url+domain
            website = Website.objects.filter(Q(root_url=weburl) | Q(root_url=weburl+'/'))
    
            if website:
                return website[0]
            else:
                raise Exception(weburl, 'Website not Found')
            