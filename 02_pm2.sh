#!/bin/bash

# pm2 setup

curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
apt install nodejs
npm install pm2 -g
