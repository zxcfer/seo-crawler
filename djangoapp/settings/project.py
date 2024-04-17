# -*- coding: utf-8 -*-

"""
    Project settings for web
    Author  :   iwxfer <iwxfer@gmail.com>
"""

from defaults import *
from getenv import env

TEMPLATE_CONTEXT_PROCESSORS += (
    "allauth.account.context_processors.account",
    "allauth.socialaccount.context_processors.socialaccount"
)


INSTALLED_APPS += (
    'applications.front',
)

AUTHENTICATION_BACKENDS = (
    "django.contrib.auth.backends.ModelBackend",
    "allauth.account.auth_backends.AuthenticationBackend",
)

ACCOUNT_EMAIL_VERIFICATION = "mandatory"
ACCOUNT_EMAIL_REQUIRED=True

GRAPPELLI_ADMIN_TITLE = "Admin"

PIPELINE_CSS = {
    'stylesheets': {
        'source_filenames': (
        ),
        'output_filename': 'stylesheets.css',
        'extra_context': {
            'media': 'screen,projection',
        },
    },
}

PIPELINE_JS = {
    'scripts': {
        'source_filenames': (
        ),
        'output_filename': 'scripts.js',
    }
}

# LOGIN_URL = '/login/'
LOGIN_URL = '/accounts/login/'
LOGIN_REDIRECT_URL = '/sentiment-monitor/'
LOGOUT_URL = '/accounts/login/'