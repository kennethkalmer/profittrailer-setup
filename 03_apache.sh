#!/bin/bash

# Setup apache vhosts with SSL
add-apt-repository ppa:certbot/certbot -y
apt update
apt install apache2 python-certbot-apache -y

# Proxy modules
a2enmod proxy
a2enmod proxy_http
