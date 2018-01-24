#!/bin/bash

set -e
[ ! -z "${DEBUG}" ] && set -x

# Where our tooling is
TOOL_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd  )
export TOOL_DIR
source "${TOOL_DIR}/config.sh"


SERVER_NAME=$1
PORT=$2

if [ -z "${SERVER_NAME}" ] || [ -z "${PORT}" ]; then

    echo "Usage: ./add-site.sh SERVER_NAME PORT"
    echo

    exit 1

fi

if [ -f "/etc/apache2/sites-available/${SERVER_NAME}.conf" ]; then

  echo "Warning! There is already a virtual host configured for ${SERVER_NAME}"
  echo
  read -p "Press ENTER to overwrite it >"

  rm -f "/etc/apache2/sites-available/${SERVER_NAME}.conf" \
    "/etc/apache2/sites-enabled/${SERVER_NAME}.conf"
fi

cat site-template.conf | \
    sed -e "s/SERVER_NAME/${SERVER_NAME}/g" | \
    sed -e "s/PORT/${PORT}/g" \
    > "/etc/apache2/sites-available/${SERVER_NAME}.conf"


a2ensite "${SERVER_NAME}"

service apache2 reload

CERTBOT_MAIL=""
if [ ! -z "${CERTBOT_CONTACT}" ]; then
  CERTBOT_MAIL="-m ${CERTBOT_CONTACT}"
fi

certbot --authenticator standalone \
  --installer apache \
  -d "${SERVER_NAME}" \
  --pre-hook "service apache2 stop" \
  --post-hook "service apache2 start" \
  "${CERTBOT_MAIL}" \
  --redirect
