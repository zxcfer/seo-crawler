#! /bin/bash

echo "################################################"
echo "### Configure directories"
echo "################################################"

mkdir -p project/locale

echo "################################################"
echo "### Configure database"
echo "################################################"

sudo -u postgres psql -c "CREATE USER $DJANGO_DATABASE_USER WITH PASSWORD '$DJANGO_DATABASE_PASSWORD';"
sudo -u postgres psql -c "CREATE DATABASE $DJANGO_DATABASE_NAME;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $DJANGO_DATABASE_NAME to $DJANGO_DATABASE_USER;"

# sudo -u postgres psql -c "CREATE USER root WITH PASSWORD 'root';"
# sudo -u postgres psql -c "CREATE DATABASE searchengine WITH OWNER fer ENCODING 'utf-8';"
# sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE searchengine to root;"

# sudo -u postgres psql -c "ALTER DATABASE searchengine OWNER TO root;"
