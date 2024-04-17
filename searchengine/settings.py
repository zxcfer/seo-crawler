# -*- coding: utf-8 -*-

# Scrapy settings for searchengine project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'searchengine'

SPIDER_MODULES = ['searchengine.spiders']
NEWSPIDER_MODULE = 'searchengine.spiders'

# Headers
USER_AGENT = 'w3m/0.5.3'
DEPTH_LIMIT = 10
#USER_AGENT = 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36'
DEFAULT_REQUEST_HEADERS = {
    'Accept': 'text/html, text/*;q=0.5, image/*',
    'Accept-Language': 'en;q=1.0',
}

#SPLASH_URL = 'http://192.168.59.103:8050'
REDIRECT_ENABLED = False
DOWNLOADER_MIDDLEWARES = {
#    'scrapyjs.SplashMiddleware': 725,
#    'searchengine.middlewares.IgnoreDuplicates': 543,
}
#SPLASH_ENABLED = True
#SPLASH_ENDPOINT = 'http://192.168.59.103:8050'
#DUPEFILTER_CLASS = 'scrapyjs.SplashAwareDupeFilter'
#HTTPCACHE_STORAGE = 'scrapyjs.SplashAwareFSCacheStorage'
REACTOR_THREADPOOL_MAXSIZE = 10
# ITEM_PIPELINES = {'scrapy.pipelines.files.FilesPipeline': 1,
#                   'scrapy.pipelines.images.ImagesPipeline': 2,
#                   'searchengine.middlewares.FileOrImagePipeline': 3
#                   }
FILES_STORE = 'D:/tmp/'
IMAGES_STORE = 'D:/tmp/'
##
## Django setup
##
import sys
import os

# En windows crear la variable de entorno:
#   setx SEOSPIDER_PROJECT_HOME "F:\\FERNANDO\\seospider\\"
# En linux usar export y la ruta base del proyecto
if os.name == 'nt':
	DJANGO_HOME = os.getenv('SEOSPIDER_PROJECT_HOME')+'djangoapp'
else:
	DJANGO_HOME = os.getenv('PROJECT_HOME')+'djangoapp'

sys.path.append(DJANGO_HOME)

os.environ['DJANGO_SETTINGS_MODULE'] = 'settings.project'
