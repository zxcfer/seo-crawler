'''
Common functions
'''
import re

def clean_google_url(url, startstr = '/url?q='):
    '''Clean google search URL'''
    return url.replace(startstr, '').split('&')[0]

def domain_from_url(url):
    if '://' in url:
        return url.split('://')[1].split('/')[0]
    else:
        return url.split('/')[0]
