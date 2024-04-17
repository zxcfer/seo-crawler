# -*- coding: utf-8 -*-
# http://doc.scrapy.org/en/latest/topics/items.html

from scrapy_djangoitem import DjangoItem

# from applications.front.models import Website
from applications.front.models import Url, UrlStatus, UrlAlert

# class WebsiteItem(DjangoItem):
#     django_model = Website

class UrlItem(DjangoItem):
    django_model = Url

class UrlStatusItem(DjangoItem):
    django_model = UrlStatus

class UrlAlertItem(DjangoItem):
    django_model = UrlAlert

