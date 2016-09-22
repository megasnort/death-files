#!/usr/bin/env bash

function vg() {
    cd ~/vm/$1
    vagrant up
    vagrant ssh
}