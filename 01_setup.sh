#!/bin/bash

# Where our tooling is
TOOL_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd  )
export TOOL_DIR
source "${TOOL_DIR}/config.sh"

# Let's get everything up to date
apt update
apt upgrade -y

# Let's get Java installed
apt install software-properties-common -y
add-apt-repository ppa:webupd8team/java -y
apt update
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
apt install oracle-java8-installer -y

# Let's install some other utilities we need
apt install wget unzip -y

# Let's set a proper hostname
echo "${SERVER_NAME}" > /etc/hostname
echo -e "127.0.0.1 ${SERVER_NAME}\n$(cat /etc/hosts)" > /etc/hosts

# Let's add a user for ProfitTrailer
useradd -m -s /bin/bash profittrailer

clear

echo
echo "Please set a password for your profittrailer user"
echo

passwd profittrailer

