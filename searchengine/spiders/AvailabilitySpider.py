import datetime
import scrapy
from scrapy.log import INFO

import django
django.setup()
from applications.front.models import Website, WebsiteAvailability, WebsiteAvailabilityStats

# cuida la Identacion, porque puede que te salga un error
class AvailabilitySpider(scrapy.Spider):
    name = "availabilityspider"
    start_urls = []
    today = datetime.date.today()
    handle_httpstatus_list = [400,401,402,403,404,405,406,407,408,409,
                              410,411,412,413,414,415,416,417,
                              501,502,503,504,505]

    def __init__(self):
        websites = Website.objects.filter(status=Website.WEBSITE_ACTIVE)
        for x in websites:
            self.start_urls.append(x.root_url)

    def parse(self, response):
        website = Website.objects.get(root_url=response.url)
        wa = WebsiteAvailability(website=website)

        if response.status in self.handle_httpstatus_list:
            wa.availability=WebsiteAvailability.OFF
        else:
            wa.availability=WebsiteAvailability.ON
        
        wa.save()
        
        was_last_8h = WebsiteAvailability.last_hours(8)
        on_8h = was_last_8h.filter(availability=1).count()
        off_8h = was_last_8h.filter(availability=0).count()
        average_8h = on_8h * 100 / (on_8h + off_8h)
        self.log("== 8 hours average <{0}>".format(average_8h), INFO)
        was,neu = WebsiteAvailabilityStats.objects.get_or_create(
                website=website,
                type=WebsiteAvailabilityStats._8H,
                created_for=self.today)
        was.average = average_8h
        was.save()
        
        was_last_24h = WebsiteAvailability.last_hours(24)
        on_24h = was_last_24h.filter(availability=1).count()
        off_24h = was_last_24h.filter(availability=0).count()
        average_24h = on_24h * 100 / (on_24h + off_24h)
        self.log("== 24 hours average <{0}>".format(average_24h), INFO)
        was,neu = WebsiteAvailabilityStats.objects.get_or_create(
                website=website,
                created_for=self.today,
                type=WebsiteAvailabilityStats._24H)
        was.average = average_8h
        was.save()
        
        was_last_7d = WebsiteAvailability.last_days(7)
        on_7d = was_last_7d.filter(availability=1).count()
        off_7d = was_last_7d.filter(availability=0).count()
        average_7d = on_7d * 100 / (on_7d + off_7d)
        self.log("== 7 days average <{0}>".format(average_7d), INFO)
        was,neu = WebsiteAvailabilityStats.objects.get_or_create(
                website=website,
                created_for=self.today,
                type=WebsiteAvailabilityStats._7D)
        was.average = average_8h
        was.save()

        was_last_30d = WebsiteAvailability.last_days(7)
        on_30d = was_last_30d.filter(availability=1).count()
        off_30d = was_last_30d.filter(availability=0).count()
        average_30d = on_30d * 100 / (on_30d + off_30d)
        self.log("== 30 days average <{0}>".format(average_30d), INFO)
        was,neu = WebsiteAvailabilityStats.objects.get_or_create(
                website=website,
                created_for=self.today,
                type=WebsiteAvailabilityStats._30D)
        was.average = average_8h
        was.save()
