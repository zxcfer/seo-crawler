#! /bin/bash

echo "################################################"
echo "### Install packages and dependencies"
echo "################################################"

sudo apt-get update
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install unzip
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install gettext
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install curl
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install git
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install nano
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install build-essential
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install libxml2-dev
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install libxslt1-dev
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install libjpeg8-dev
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install libpng12-dev
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install libpq-dev
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install autoconf
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install g++
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install python
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install python-dev
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install python-pip
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install postgres
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install postgresql-contrib
DEBIAN_FRONTEND=noninteractive sudo apt-get -y install postgresql-server-dev-all

echo "################################################"
echo "### Install python packages"
echo "################################################"

pip install --user -r project/requirements.txt

echo "################################################"
echo "### Install pgweb"
echo "################################################"

wget -O pgweb.zip https://github.com/sosedoff/pgweb/releases/download/v0.5.0/pgweb_linux_386.zip
unzip pgweb.zip
rm -rf pgweb.zip
mv pgweb_linux_386 ~/.local/bin/pgweb
