#!/bin/bash

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

# Let's add a user for ProfitTrailer
useradd -m profittrailer

echo
echo "Please set a password for your profittrailer user"
echo

passwd profittrailer
