#!/usr/bin/env bash

# function to reset a symfony (2.) project
function sfreset() {
    app/console doctrine:schema:update --force
    app/console doctrine:fixtures:load -n
    app/console cache:clear
}

alias ac='app/console'

# FORK CMS
alias cc='./tools/remove_cache'

# For the good 'ol capistrano deployment
alias yolo='cap production deploy'
