import scrapy
from searchengine.items import UrlItem, UrlStatusItem, UrlAlertItem
from scrapy.contrib.linkextractors import LinkExtractor

import django
from django.db.models import Q
from django.core.context_processors import request
django.setup()
from applications.front.models import Website, Alert

# cuida la Identacion, porque puede que te salga un error
class RobotsSpider(scrapy.Spider):
    name = "robotscrawler"
    start_urls = []

    def __init__(self):
        websites = Website.objects.filter(status=Website.WEBSITE_ACTIVE)
        for x in websites:
            self.start_urls.append(x.root_url+'robots.txt')

    def parse(self, response):
        # Meta robots tags (NOINDEX,FOLLOW / NOINDEX,NOFOLLOW / INDEX,FOLLOW)
        #self.pushAlert(104, response.url)
        robots = response.body.split('')
        
        # TODO: get all allow/disallow + agent
        # register it
        # check if previous crawl exists
        # alert new, alert deleted
        
         
            
