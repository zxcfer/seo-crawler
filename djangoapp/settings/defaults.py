# -*- coding: utf-8 -*-

"""
    Default settings for web
    Author  :   iwxfer <iwxfer@gmail.com>
"""

import os.path
from getenv import env

##
## Paths
##
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

##
## Debug
##
DEBUG = env('DJANGO_DEBUG')
TEMPLATE_DEBUG = DEBUG


##
## Database
##
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': env('SEO_AUDIT_DATABASE_NAME'),
        'USER': env('SEO_AUDIT_DATABASE_USER'),
        'PASSWORD': env('SEO_AUDIT_DATABASE_PASSWORD'),
        'HOST': 'localhost',
        'PORT': '3306',
    }
}


##
## I18N & L18N
##
TIME_ZONE = 'America/Mexico_City'
LANGUAGES = (
  ('en', 'English'),
  ('es', 'Spanish'),
)
USE_I18N = True
USE_L10N = True
USE_TZ = True
LOCALE_PATHS = (
    os.path.join(BASE_DIR, 'locale/'),
)


##
## Security
##
SECRET_KEY = 'hcyf!<secret key here>'


##
## URL's
##
ROOT_URLCONF = 'urls'


##
## Deploy
##
WSGI_APPLICATION = 'wsgi.application'


##
## Domains
##
ALLOWED_HOSTS = ['*']


##
## Middlewares
##
MIDDLEWARE_CLASSES = (
    # 'applications.front.module.BasicAuthMiddleware', # for development
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'htmlmin.middleware.HtmlMinifyMiddleware',
    'htmlmin.middleware.MarkRequestMiddleware',
)

##
## Basic Auth for development stage
##
BASICAUTH_USERNAME = 'user'
BASICAUTH_PASSWORD = 'pass'

##
## Media & Statics
##
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static')
STATIC_URL = '/static/'
STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'assets'),
)
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
    'compressor.finders.CompressorFinder',
)
COMPRESS_OUTPUT_DIR = 'cache'
COMPRESS_OFFLINE = True


##
## Templates
##
TEMPLATE_LOADERS = (
    # 'django.template.loaders.eggs.Loader',
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
)
TEMPLATE_DIRS = (
    os.path.join(BASE_DIR, 'templates'),
)
TEMPLATE_CONTEXT_PROCESSORS = (
    'django.core.context_processors.i18n',
    'django.core.context_processors.media',
    'django.core.context_processors.debug',
    'django.core.context_processors.static',
    'django.core.context_processors.request',
    'django.contrib.auth.context_processors.auth',
    'django.contrib.messages.context_processors.messages',
)


##
## Apps
##
INSTALLED_APPS = (
    'grappelli',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',
)


##
## Django Test Runner
##
TEST_RUNNER = 'django.test.runner.DiscoverRunner'


##
## Django Debug Tool Bar
##
if DEBUG:
    INTERNAL_IPS = ('10.0.2.2',)
    INSTALLED_APPS += ('debug_toolbar',)


##
## Mail
##
EMAIL_USE_TLS = env('DJANGO_EMAIL_USE_TLS')
EMAIL_HOST = env('DJANGO_EMAIL_HOST')
EMAIL_HOST_USER = env('DJANGO_EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = env('DJANGO_EMAIL_HOST_PASSWORD')
EMAIL_PORT = '587' # env('DJANGO_EMAIL_PORT')


##
## Admins
##
ADMINS = (
        ('iwxfer', 'iwxfer@gmail.com'),
)
MANAGERS = ADMINS


##
## Logs
##
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}

SITE_ID = 1
