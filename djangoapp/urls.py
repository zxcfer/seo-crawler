# -*- coding: utf-8 -*-

"""
    Urls for web
    Author  :   iwxfer <iwxfer@gmail.com>
"""

from django.conf.urls import patterns, include, url
from django.contrib import admin
from django.conf import settings


urlpatterns = patterns('',
    
 
    )

if settings.DEBUG:
    from django.conf.urls.static import static
    import debug_toolbar
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += patterns('',
        url(r'^__debug__/', include(debug_toolbar.urls)),
    )
