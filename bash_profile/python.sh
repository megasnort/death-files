#!/usr/bin/env bash

export WORKON_HOME=~/Envs



function dj() {
    if [ -z "$1" ]; then
        echo "Provide the name of the existing django project"
    elif [ ! -f ~/Python/$1/$1/manage.py ]; then
        echo "$1 is not an existing django project"
    else
        osascript <<-EOF
    tell application "iTerm"
        tell (current terminal)
            tell the current session to write text "cd ~/Python/$1/$1 && workon $1 && charm . && python manage.py runserver"
            tell application "System Events" to keystroke "d" using command down
            tell the current session to write text "cd ~/Python/$1/$1 && workon $1"
        end tell
    end tell
EOF
    fi
}

source /usr/local/bin/virtualenvwrapper.sh

alias pm='python manage.py '
