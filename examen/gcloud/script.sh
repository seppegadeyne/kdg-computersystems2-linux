#!/bin/bash
#
# Author: Geert De Paepe
# Version: 1.0
# Description: Installs Joomla in gcloud
# Dependencies: gcloud SDK, mysql-client package
#
REGION=europe-west1
ZONE=europe-west1-b
DB_INSTANCE=joomla-$RANDOM
DB_NAME=joomla
DB_USER=joomla
INSTANCE_NAME=joomla
IMAGE_PROJECT=ubuntu-os-cloud
IMAGE_FAMILY=ubuntu-1804-lts
FIREWALL_RULE=default-allow-http
TAG=http-server

dpkg -s mysql-client &> /dev/null || { echo "install package mysql-client" ; exit 1 ; }
which gcloud &> /dev/null || { echo "install gcloud SDK" ; exit 1 ; }

read -s -p "DB root password: " rootpass
echo
read -s -p "Joomla password: " joomlapass
echo

gcloud sql instances create $DB_INSTANCE --region=$REGION --root-password=$rootpass

dbaddress=$(gcloud sql instances list | grep $DB_INSTANCE | tr -s " " | cut -f 5 -d " ")

#mysql --host $dbaddress --user=root --password=$rootpass <<!
#  CREATE DATABASE $DB_NAME;
#  CREATE USER $DB_USER IDENTIFIED BY '$joomlapass';
#  GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER;
#  FLUSH PRIVILEGES;
#!

gcloud compute instances create $INSTANCE_NAME --image-project=$IMAGE_PROJECT \
  --image-family=$IMAGE_FAMILY --zone=$ZONE --tags=$TAG \
  --metadata=startup-script="#!/bin/bash
  apt-get update
  apt-get install -y apache2 php libapache2-mod-php unzip
  apt-get install -y php-cli php-common php-mbstring php-gd php-intl php-xml php-mysql php-zip php-curl php-xmlrpc
  cd /tmp
  wget https://downloads.joomla.org/cms/joomla3/3-8-10/Joomla_3-8-10-Stable-Full_Package.zip
  rm /var/www/html/index.html
  unzip Joomla_3-8-10-Stable-Full_Package.zip -d /var/www/html
  cp /var/www/html/htaccess.txt /var/www/html/.htaccess
  chown -R www-data.www-data /var/www/html
  chmod -R 755 /var/www/html
  sudo service apache2 restart"

if ! gcloud compute firewall-rules describe $FIREWALL_RULE &> /dev/null ;then
  gcloud compute firewall-rules create $FIREWALL_RULE --allow=tcp:80 --target-tags=$TAG
fi
ipadress=$(gcloud compute instances list | grep $INSTANCE_NAME | tr -s " " | cut -d " " -f 5)
gcloud sql instances patch $DB_INSTANCE --authorized-networks=$ipadress/32 --quiet