#!/bin/bash

sudo apt-get update

sudo apt-get --assume-yes install git
sudo apt-get --assume-yes install htop
sudo apt-get --assume-yes install docker-engine
sudo apt-get --assume-yes install unzip
sudo apt-get --assume-yes install apt-file
apt-file update

# python
sudo apt-get --assume-yes install python-pip
sudo apt-get --assume-yes install python-dev
sudo apt-get --assume-yes install python3-dev
sudo pip install virtualenvwrapper

# postgres
sudo apt-get --assume-yes install postgresql
sudo apt-get --assume-yes install postgresql-contrib
sudo apt-get --assume-yes install python-psycopg2
sudo apt-get --assume-yes install libpq-dev


sudo apt-get --assume-yes install memcached

#redis
sudo apt-get --assume-yes install build-essential
sudo apt-get --assume-yes install tcl8.5
sudo apt-get --assume-yes install redis-server


# java
sudo apt-get --assume-yes install openjdk-7-jre
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer

# elasticsearch
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
sudo apt-get update
sudo apt-get --assume-yes install elasticsearch
sudo update-rc.d elasticsearch defaults 95 10

echo "Do not forget to add the virtualenvwrapper script to .bash_profile"
