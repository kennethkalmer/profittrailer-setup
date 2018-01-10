#!/bin/bash

# Where our tooling is
TOOL_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd  )
export TOOL_DIR
source "${TOOL_DIR}/config.sh"

# Setup apache vhosts with SSL
add-apt-repository ppa:certbot/certbot -y
apt update
apt install apache2 python-certbot-apache -y

# Proxy modules
a2enmod proxy
a2enmod proxy_http

# Restart apache
service apache2 restart

# Enable certbot to update certs daily
if [ -d /etc/cron.d ]; then
  echo "Installing cron entry to run certbot twice daily"
  cp -v "${TOOL_DIR}/etc/cron.d/certbot" /etc/cron.d/certbot
fi
