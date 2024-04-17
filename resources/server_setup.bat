sudo pip install Scrapy==0.24.5
sudo pip install django==1.7.6
sudo pip install django-getenv==1.3.1
sudo pip install psycopg2

# add keys for bitbucket
git clone https://iwxfer@bitbucket.org/iwxfer/search-engine-crawler.git
git clone git@bitbucket.org:iwxfer/search-engine-crawler.git

setx PROJECT_HOME D:\Sites\searchengine

setx DJANGO_DEBUG True

setx DJANGO_DATABASE_NAME searchengine
setx DJANGO_DATABASE_USER postgres
setx DJANGO_DATABASE_PASSWORD postgres
setx DJANGO_DATABASE_HOST 127.0.0.1
setx DJANGO_DATABASE_PORT 5433

setx DJANGO_EMAIL_USE_TLS True
setx DJANGO_EMAIL_HOST smtp.gmail.com
setx DJANGO_EMAIL_HOST_USER bufer4@gmail.com
setx DJANGO_EMAIL_HOST_PASSWORD Gr33nB3r3t
setx DJANGO_EMAIL_PORT 587

# create user and grant ownership
sudo -u postgres psql -c "CREATE USER djuser WITH PASSWORD 'pM0dF3r21.';"
sudo -u postgres psql -c "CREATE DATABASE searchengine WITH OWNER djuser ENCODING 'utf-8';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE searchengine to djuser;"

# or just excecute sql.file to create user and database
sudo -u postgres psql -f create_user_and_database.sql

# scrapy model migrations
cd \searchengine\minidjango
python manage.py makemigrations app
python manage.py migrate app