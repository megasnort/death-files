#!/usr/bin/env bash

# show path in list
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

# show who is connected to my iTunes
function itns() {
    lsof +D ~/Music/iTunes/iTunes\ Music/ -i | grep iTunes
}

# function to show the current branch in the prompt
function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# overwrite ls
function ls() {
	/bin/ls -alh "$@"
}

# prompt
export PS1="\[\033[33m\]\u\[\033[31m\]@\h\[\033[00m\] \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "

function backup() {
    rsync  -avxP /media/stef/fotos/fotos/ /media/stef/timeshift/fotos/
	rsync --exclude ~/Downloads --exclude ~/Music/Notenkrakers --exclude /home/stef/Music/The\ Greatest\ Discovery\:\ New\ Star\ Trek\ Reviewed/ --exclude /home/stef/Music/The\ Greatest\ Generation/ -avxP ~ /media/stef/timeshift/ds9/
}
