#!/usr/bin/env python
from twisted.enterprise import adbapi
from twistar.registry import Registry
from twistar.dbobject import DBObject
from twisted.internet import reactor
import config

class Website(DBObject):
    TABLENAME='website'
    pass

def update_websites(websites):
    for website in websites:
        website.root_url = website.url
        website.save()
    reactor.stop()
        
# Connect to the DB
Registry.DBPOOL = adbapi.ConnectionPool('MySQLdb', 
                                        user=config.USER, 
                                        passwd=config.PASS, 
                                        db=config.DATABASE)

# update website_root
Website.find(where=['root_url="" OR root_url IS NULL']).addCallback(update_websites)

reactor.run()