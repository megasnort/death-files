#!/usr/bin/env bash

function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}


function itns() {
    lsof +D ~/Music/iTunes/iTunes\ Music/ -i | grep iTunes
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


