##
## Installation
##
sudo apt-get install libxml2-dev libxslt1-dev python-dev
sudo apt-get install postgresql
sudo apt-get install libpq-dev
sudo apt-get install python-pip
sudo apt-get install git
sudo apt-get install autoconf g++ python2.7-dev
sudo apt-get install libffi-dev

# sudo easy_install pyOpenSSL==0.13 # ?
# sudo easy_install pycrypto
sudo pip install Scrapy==0.24.5 -I
sudo pip install django==1.7.6
sudo pip install django-getenv==1.3.1
sudo pip install psycopg2

# add keys for bitbucket
git clone https://iwxfer@bitbucket.org/iwxfer/search-engine-crawler.git
git clone git@bitbucket.org:iwxfer/search-engine-crawler.git

# add this to ~/.bashrc file and login again
export PROJECT_HOME=/home/djuser/project

export DJANGO_DEBUG=True

export DJANGO_DATABASE_NAME=searchengine
export DJANGO_DATABASE_USER=djuser
export DJANGO_DATABASE_PASSWORD=pM0dF3r21.
export DJANGO_DATABASE_HOST=127.0.0.1
export DJANGO_DATABASE_PORT=5432

export DJANGO_EMAIL_USE_TLS=True
export DJANGO_EMAIL_HOST=smtp.gmail.com
export DJANGO_EMAIL_HOST_USER=bufer4@gmail.com
export DJANGO_EMAIL_HOST_PASSWORD=Gr33nB3r3t
export DJANGO_EMAIL_PORT=587

# create user and grant ownership
sudo -u postgres psql -c "CREATE USER djuser WITH PASSWORD 'pM0dF3r21.';"
sudo -u postgres psql -c "CREATE DATABASE searchengine WITH OWNER djuser ENCODING 'utf-8';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE searchengine to djuser;"

# or just excecute sql.file to create user and database
sudo -u postgres psql -f create_user_and_database.sql

# scrapy model migrations
cd search-engine-crawler/
cd searchengine/minidjango/
python manage.py makemigrations app
python manage.py migrate app

##
## User management
##
python manage.py createsuperuser


##
## Deployment
## 
# http://uwsgi-docs.readthedocs.org/en/latest/tutorials/Django_and_nginx.html
sudo apt-get install nginx
sudo apt-get install libpcre3 libpcre3-dev
sudo pip install uwsgi

cd ~/search-engine/djangoapp
uwsgi --http :8000 --module wsgi

sudo ln -s ~/search-engine/djangoapp/django_nginx.conf /etc/nginx/sites-enabled/
python manage.py collectstatic
sudo /etc/init.d/nginx restart

uwsgi --ini django_uwsgi.ini
uwsgi --socket django.sock --module mysite.wsgi --chmod-socket=664