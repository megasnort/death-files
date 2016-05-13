#!/usr/bin/env bash

# show path in list
path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

# show who is connected to my iTunes
itns() {
    lsof +D ~/Music/iTunes/iTunes\ Music/ -i | grep iTunes
}

# function to show the current branch in the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# prompt
export PS1="\[\033[33m\]\u\[\033[35m\]@\h\[\033[00m\] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "


