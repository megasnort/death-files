#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Adding sourcing of domain specific files to .bash_profile"
echo "for file in $DIR/bash_profile/*; do source \$file; done" >> ~/.bash_profile
echo "Copying .-files to ~/"
find $DIR -maxdepth 1 -type f -name '.*' | xargs -I {} cp {} ~/
