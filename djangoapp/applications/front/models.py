from datetime import timedelta, date
from django.db import models
from django.utils import timezone
from django.template.defaultfilters import default

class Website(models.Model):

    WEBSITE_INACTIVE = 0
    WEBSITE_ACTIVE = 1
    WEBSITE_RUNNING = 2

    WEBSITE_STATUSES = (
        (WEBSITE_ACTIVE, 'inactive'),
        (WEBSITE_INACTIVE, 'active'),
        (WEBSITE_RUNNING, 'running'),
    )
    name = models.CharField(max_length=250, null=True)
    root_url = models.CharField(max_length=250, null=True) # TODO unique
    description = models.TextField(null=True, blank=True)
    status = models.IntegerField(default=WEBSITE_ACTIVE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    max_urls = models.IntegerField(null=True)
    schedule = models.IntegerField(default=1)
    crawl_day = models.IntegerField(default=1)
    crawl_hour = models.TimeField(null=True)
    deleted_at = models.DateTimeField(null=True)

    def __unicode__(self):
        return self.root_url

    class Meta:
        ordering = ('updated_at',)
        db_table = 'website'

    def has_crawls_this_week(self):
        # get start of week, end of week
        # created_at__range=(start_date, end_date)
        if Crawl.objets.filter(website=self.id):
            return True
        else:
            return False

    def has_crawls_this_month(self):
        # get date: start/end of month
        # created_at__range=(start_date, end_date)
        if Crawl.objets.filter(website=self.id):
            return True
        else:
            return False

    def has_crawls_today(self):
        # created_at__range=(start_date, end_date)
        if Crawl.objets.filter(website=self.id, worked_on=date):
            return True
        else:
            return False
        
class Crawl(models.Model):
    website = models.ForeignKey(Website)
    notes = models.CharField(max_length=250, null=True)
    worked_on = models.DateField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return "Crawl["+self.worked_on+"]"

    class Meta:
        ordering = ('updated_at',)
        db_table = 'crawl'
        
class Url(models.Model):
    URL_TYPES = (
        (0, 'Normal'),
        (1, 'VIP'),
    )

    url = models.CharField(max_length=255)
    url_short = models.CharField(max_length=255, null=True)
    type = models.IntegerField(choices=URL_TYPES, default=0)
    website = models.ForeignKey(Website)

    def __unicode__(self):
        # return "{url:<{0}>, type:<{1}>".format(self.url, self.type)
        return "{url:<{0}>".format(self.url)

    class Meta:
        ordering = ('updated_at',)
        db_table = 'url'

class UrlStatus(models.Model):
    url = models.ForeignKey(Url)
    crawl = models.ForeignKey(Crawl)
    
    title = models.TextField(null=True, blank=True)
    meta_desc = models.TextField(null=True, blank=True)
    url_status_code = models.IntegerField(null=True)
    pagination = models.CharField(max_length=255, null=True, blank=True)
    canonical = models.CharField(max_length=255, null=True, blank=True)
    h1 = models.TextField(null=True, blank=True)
    h2 = models.TextField(null=True, blank=True)
    h3 = models.TextField(null=True, blank=True)
    h4 = models.TextField(null=True, blank=True)
    h5 = models.TextField(null=True, blank=True)
    h6 = models.TextField(null=True, blank=True)
    depth = models.IntegerField(null=True)
    robots_index = models.IntegerField(null=True)
    robots_follow = models.IntegerField(null=True)
    robots_noindex = models.IntegerField(null=True)
    robots_nofollow = models.IntegerField(null=True)
    robots_noarchive = models.IntegerField(null=True)
    robots_nosnippet = models.IntegerField(null=True)
    robots_noodp = models.IntegerField(null=True)
    robots_noydir = models.IntegerField(null=True)

    referer = models.CharField(max_length=255)
    redirect = models.CharField(max_length=255)

    struct_product = models.IntegerField(null=True)
    struct_offer = models.IntegerField(null=True)
    struct_aggreg = models.IntegerField(null=True)
    struct_review = models.IntegerField(null=True)
    struct_rating= models.IntegerField(null=True)
    
    twitter = models.IntegerField(null=True)
    facebook = models.IntegerField(null=True)
    
    og_title = models.TextField(null=True, blank=True)
    og_type = models.TextField(null=True, blank=True)
    og_url = models.TextField(null=True, blank=True)
    og_image = models.TextField(null=True, blank=True)

    images = models.IntegerField(null=True)
    no_alt_images = models.IntegerField(null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    meta_key = models.TextField(null=True, blank=True)

    def __unicode__(self):
        return self.title

    class Meta:
        ordering = ('updated_at',)
        db_table = 'url_status'

class WebsiteAvailability(models.Model):
    ON=1
    OFF=0
    WEBSITE_AVAILABILITIES =(
       (0,'on'),
       (1,'off'),
    )
    availability= models.IntegerField(choices=WEBSITE_AVAILABILITIES)
    checked_at = models.DateTimeField(auto_now=True)
    website = models.ForeignKey(Website)

    class Meta:
        ordering = ('checked_at',)
        db_table = 'website_availability'
        
    @classmethod
    def last_hours(cls, hours):
        now = timezone.now()
        start = now - timedelta(hours=hours)

        return cls.objects.filter(
            checked_at__gte=start,
            checked_at__lt=now).order_by('-checked_at')

    @classmethod
    def last_days(cls, days):
        now = timezone.now()
        start = now - timedelta(days=days)

        return cls.objects.filter(
            checked_at__gte=start,
            checked_at__lt=now).order_by('-checked_at')

class WebsiteAvailabilityStats(models.Model):
    _8H=0
    _24H=1
    _7D=2
    _30D=3
    AVERAGE_TYPES = (
         (_8H,'8 hours'),
         (_24H,'24 hours'),
         (_7D, '7 days'),
         (_30D, '30 days'),
    )
    average = models.DecimalField(max_digits=5, decimal_places=2, null=True)
    type = models.IntegerField(choices=AVERAGE_TYPES)
    website = models.ForeignKey(Website)
    created_for = models.DateField(auto_now_add=True)

    class Meta:
        ordering = ('-created_for',)
        db_table = 'website_availability_stats'
    
class WebsiteStatus(models.Model):

    RISK_CHOICES = (
        (0, 'GREEN'),
        (1, 'YELLOW'),
        (2, 'ORANGE'),
        (3, 'RED'),
    )

    WEBSITE_STATUS_TYPES =(
       (0,'daily'),
       (1,'weekly'),
    )

    risk_level = models.IntegerField(choices=RISK_CHOICES)
    reported_at= models.DateTimeField()
    status_type = models.IntegerField(choices=WEBSITE_STATUS_TYPES)
    website = models.ForeignKey(Website)
    
    class Meta:
        ordering = ('reported_at',)
        db_table = 'website_status'    
        
class Alert(models.Model):

    ALERT_SERVERETIES = (
        (0, 'GREEN'),
        (1, 'YELLOW'),
        (2, 'ORANGE'),
        (3, 'RED'),
    )
    
    typ = models.CharField(default='generic')
    severety = models.IntegerField(choices=ALERT_SERVERETIES)
    description = models.TextField(max_length=500, null=True, blank=True)

    class Meta:
        db_table = 'alert'    

class UrlAlert(models.Model):
    alert = models.ForeignKey(Alert)
    url = models.ForeignKey(Url)
    crawl = models.ForeignKey(Crawl)

    class Meta:
        ordering = ('updated_at',)
        db_table = 'url_alert'    

class WebsiteUser(models.Model):

    USER_ROLES =(
       (0, 'normal'),
       (1, 'admin'),
    )

    website = models.ForeignKey(Website)
    user_role = models.IntegerField(choices=USER_ROLES)

    class Meta:
        db_table = 'website_user'    

class Image(models.Model):
    src = models.CharField(max_length=500, null=True)
    alt = models.CharField(max_length=500, null=True)
    response_code = models.IntegerField(null=True)
    url_status = models.ForeignKey(UrlStatus)

    class Meta:
        db_table = 'images'    
