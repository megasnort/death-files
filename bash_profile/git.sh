#!/usr/bin/env bash

# notice that git autocompletion is located in the seperate .git-completion.bash file

alias g='git'


# pull all masters 
function puall() {
    for d in */ ; do
    	cd $d
    	echo "$d"
    	if [ -d .git ]; then
    		git pull origin master
    		git push origin master
		fi;
		cd ..
	done
}