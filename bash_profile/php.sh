#!/usr/bin/env bash

function sfreset() {
    app/console doctrine:schema:update --force
    app/console doctrine:fixtures:load -n
    app/console cache:clear
}

alias ac='app/console'
alias cc='./tools/remove_cache' #FORK CMS
alias yolo='cap production deploy'
