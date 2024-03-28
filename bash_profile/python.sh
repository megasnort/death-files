#!/usr/bin/env bash

# Directory for the virtualenvs of virtualenvwrapper
export WORKON_HOME=~/Envs


# go to a certain django project folder and start the virtual env
function dj() {
	if [ -z "$1" ]; then
        echo "Provide the name of the existing django project"
    else
        # window 1
    	cd ~/Python/$1/$1
    	workon $1
        code ../
        
        # split vertically
    	xdotool key "ctrl+shift+e"
        xdotool key "ctrl+Tab"
    	 
    	# split horizontal
        xdotool key "ctrl+shift+o"
        #xdotool key "ctrl+Tab"
        #workon $1

        xdg-open http://localhost:8000
        python manage.py runserver
	fi
}

# alias for working with django
alias pm='python manage.py '

