#!/usr/bin/env bash

# Directory for the virtualenvs of virtualenvwrapper
export WORKON_HOME=~/Envs




# activate the correct virtualenv on the server, or locally, and cd into the folder
function ve() {
    if [ -d ~/Python/$1/ ]; then
        workon $1
        cd ~/Python/$1
    else
        . /webapps/$1/virtualenv/bin/activate

        if [ -d /webapps/$1/$1/ ]; then
            cd /webapps/$1/$1
        else
            cd /webapps/$1
        fi
    fi
}

# Only on osx: start two terminal windows,
# one with the running flask dev-server
# one with the project-root
# both in the correct virtual env
function fl() {
    if [ -z "$1" ]; then
        echo "Provide the name of the existing flask project"
    else
        osascript <<-EOF
    tell application "iTerm2"
        tell current session of current window
            write text "workon $1 && cd ~/Python/$1"
            set newSession to (split vertically with default profile)
        end tell

        tell newSession
            write text "workon $1 && cd ~/Python/$1 && export FLASK_APP=$1.py && export FLASK_DEBUG=1 && flask run"
        end tell
    end tell
EOF
    fi
}

# Only on osx: start two terminal windows,
# one with the running django dev-server
# one with the project-root
# both in the correct virtual env
function dj() {
    if [ -z "$1" ]; then
        echo "Provide the name of the existing django project"
    else
        osascript <<-EOF
    tell application "iTerm2"
        tell current session of current window
            write text "workon $1 && cd ~/Python/$1 && cd $1"
            set newSession to (split vertically with default profile)
        end tell

        tell newSession
            write text "workon $1 && cd ~/Python/$1 && cd $1 && python manage.py runserver"
        end tell
    end tell
EOF
    fi
}

# alias for PyCharm
alias charm='open -a /Applications/PyCharm.app'

# alias for working with django
alias pm='python manage.py '

# alias for booting ugent web app manager
alias webapp='workon webapp-management-on-thoth && cd ~/Python/webapp-management-on-thoth/ && fab -l'

# add the currect python version, and pip etc. to the path
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi


function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV ~/.pyenv/shims/python "$@"
    else
        ~/.pyenv/shims/python "$@"
    fi
}
