#!/usr/bin/env bash

# Directory for the virtualenvs of virtualenvwrapper
export WORKON_HOME=~/Envs

# activate virtualenv on the server
function ve() {
    . /webapps/$1/virtualenv/bin/activate
    cd /webapps/$1/
    # should the subdirectory not have the same name, we're in the root dir anyway
    cd $1
}

# osx: start two terminal windows,
# one with the running django dev-server
# one with the project-root
# both in the correct virtual env
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

# alias for working with django
alias pm='python manage.py '

# add the currect python version, and pip etc. to the path
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi


function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV ~/.pyenv/shims/python "$@"
    else
        ~/.pyenv/shims/python "$@"
    fi
}
