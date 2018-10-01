#!/usr/bin/env bash

# Directory for the virtualenvs of virtualenvwrapper
export WORKON_HOME=~/Envs




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

# go to a certain django project folder and start the virtual env
function dj() {
	if [ -z "$1" ]; then
        echo "Provide the name of the existing django project"
    else
    	cd ~/Python/$1/$1
    	workon $1
    	xdotool key "ctrl+shift+e"
        code ../
    	python manage.py runserver
	fi
}

# Start a tmux session for a named django projec
# one with the running django dev-server
# one with the project-root
# both in the correct virtual env

function djtmux() {
    if [ -z "$1" ]; then
        echo "Provide the name of the existing django project"
    else
        tmux attach -t "$1" || tmux new -s "$1" \; \
          send-keys "workon $1 && cd ~/Python/$1/$1" C-m \; \
          split-window -h \; \
          send-keys "workon $1 && cd ~/Python/$1 && cd $1 && python manage.py runserver" C-m \; \
          select-pane -t 0
    fi
}

# alias for working with django
alias pm='python manage.py '

# alias for booting ugent web app manager
alias webapp='workon webapp-management-on-thoth && cd ~/Python/webapp-management-on-thoth/ && fab -l'
