#!/usr/bin/env bash


if hash apachectl 2>/dev/null; then
    alias sarl='sudo apachectl -k restart'
    alias sars='sudo apachectl -k restart'
else
    alias sarl='sudo service apache2 reload'
    alias sars='sudo service apache2 restart'
fi
