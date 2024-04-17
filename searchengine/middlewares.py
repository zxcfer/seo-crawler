from scrapy.exceptions import IgnoreRequest

import django

django.setup()
from applications.front.models import UrlStatus

class IgnoreDuplicates():

    def process_request(self, request, spider):
        crawl = request.meta['crawl']
        print request.url
        if UrlStatus.objects.filter(url__url=request.url, crawl=crawl):
            print "---------------------------- ignoring"
            raise IgnoreRequest()
        else:
            if request.url == "http://www.binacube.com/fer.html":
                print 'x'
            print "---------------------------- working"
            return None
        
