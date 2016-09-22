#!/usr/bin/env bash

# create a database with the same name and password, of course, only for local development

function mkpostgres() {
    createuser --pwprompt --createrole --superuser $1
    createdb -O$1 -Eutf8 $1
}
