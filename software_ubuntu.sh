#!/bin/bash

sudo apt-get update

sudo apt-get install docker-engine

sudo apt-get install python-pip
sudo pip install virtualenvwrapper

echo "Do not forget to add the virtualenvwrapper script to .bash_profile"

sudo apt-get install postgresql
sudo apt-get install postgresql-contrib
sudo apt-get install python-psycopg2
sudo apt-get install libpq-dev
sudo apt-get install python-dev
sudo apt-get install python3-dev