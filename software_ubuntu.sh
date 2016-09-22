#!/bin/bash

sudo apt-get update

sudo apt-get install htop
sudo apt-get install docker-engine

# python
sudo apt-get install python-pip
sudo pip install virtualenvwrapper
sudo apt-get install python-dev
sudo apt-get install python3-dev


# postgres
sudo apt-get install postgresql
sudo apt-get install postgresql-contrib
sudo apt-get install python-psycopg2
sudo apt-get install libpq-dev


sudo apt-get install memcached

#redis
sudo apt-get install build-essential
sudo apt-get install tcl8.5
sudo apt-get install redis-server


# java
sudo apt-get install openjdk-7-jre
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer

# elasticsearch
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
sudo apt-get update
sudo apt-get install elasticsearch
sudo update-rc.d elasticsearch defaults 95 10
