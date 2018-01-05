#!/bin/bash

SERVER_NAME=$1
PORT=$2

if [ -z ${SERVER_NAME} ] || [ -z ${PORT} ]; then

    echo "Usage: ./add-site.sh SERVER_NAME PORT"
    echo

    exit 1

fi

cat site-template.conf | \
    sed -e "s/SERVER_NAME/${SERVER_NAME}/g" | \
    sed -e "s/PORT/${PORT}/g" | \
    tee -a "/etc/apache2/sites-available/${SERVER_NAME}.conf"


a2ensite ${SERVER_NAME}

service apache2 reload
