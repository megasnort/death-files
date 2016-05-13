#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

COMMAND="for file in $DIR/bash_profile/*; do source \$file; done"

if grep -q "$DIR/bash_profile" ~/.bash_profile; then
    echo "Skip adding sourcing of domain specific files to .bash_profile"
else
    echo "Adding sourcing of domain specific files to .bash_profile"
    echo $COMMAND >> ~/.bash_profile
fi

echo "Copying .-files to ~/"
find $DIR -maxdepth 1 -type f -name '.*' | xargs -I {} cp {} ~/
