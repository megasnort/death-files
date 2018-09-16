#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

COMMAND="for file in $DIR/bash_profile/*; do source \$file; done"

if [ -z "$1" ]; then
    HOME_TEMP=~
else
    HOME_TEMP=$1
fi

if grep -q "$DIR/bash_profile" $HOME_TEMP/.bash_profile; then
    echo "Skip adding sourcing of domain specific files to .bash_profile"
else
    echo "Adding sourcing of domain specific files to .bash_profile"
    echo $COMMAND >> $HOME_TEMP/.bash_profile
fi

echo "Copying .-files to $HOME_TEMP/"
find $DIR -maxdepth 1 -type f -name '.*' | xargs -I {} cp {} $HOME_TEMP/

source ~/.bash_profile

