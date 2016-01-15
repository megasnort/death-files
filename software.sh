#!/bin/bash

# INSTALL ALL THE THINGS
# to update, add "update"

#@todo: 1. check if package managers exists, if not install
#@todo: 2. frontend stuff, gulp, bundler, npm, gem, ...
#@todo: 3. app store update
#@todo: 4. Auto install Apache, MySQL and PHP


# Update all package managers
brew upgrade
composer selfupdate
pip install --upgrade pip


# Check if we just need to install new software present in this file
# or we should update existing software
if [ "$1" == "update" ]; then
  pipupgrade="--upgrade"
  brewupgrade="--force"
  brew update
else
  pipupgrade=""
  brewupgrade=""
fi


# PIP
pip install $pipupgrade virtualenv
pip install $pipupgrade virtualenvwrapper


# BREW
brew install git
brew install tmux
brew install php56
brew install figlet
brew install sqlite
brew install composer
brew install postgresql
brew install php-code-sniffer


# CASK
# clean the cache so we will not install old versions
brew cask cleanup

# general
brew cask install java $brewupgrade
brew cask install disk-inventory-x $brewupgrade

# browsers
brew cask install opera $brewupgrade
brew cask install firefox $brewupgrade
brew cask install google-chrome $brewupgrade

# text editors
brew cask install atom $brewupgrade
brew cask install coda $brewupgrade
brew cask install phpstorm $brewupgrade
brew cask install sublime-text $brewupgrade

# database
brew cask install psequel $brewupgrade
brew cask install sequel-pro $brewupgrade
brew cask install mysqlworkbench $brewupgrade

# images
brew cask install seashore $brewupgrade

# dtp
brew cask install scribus $brewupgrade
brew cask install inkscape $brewupgrade

# text
brew cask install mou $brewupgrade
brew cask install libreoffice $brewupgrade

# games
brew cask install nestopia $brewupgrade

# video
brew cask install vlc $brewupgrade
brew cask install aegisub $brewupgrade
brew cask install mplayerx $brewupgrade
brew cask install handbrake $brewupgrade

# communications
brew cask install skype $brewupgrade
brew cask install hipchat $brewupgrade
brew cask install colloquy $brewupgrade

# misc
brew cask install iterm2 $brewupgrade
brew cask install alfred $brewupgrade
brew cask install alarm-clock $brewupgrade
brew cask install google-earth $brewupgrade
brew cask install github-desktop $brewupgrade
brew cask install disk-inventory-x $brewupgrade

# files
brew cask install dropbox $brewupgrade
brew cask install filezilla $brewupgrade
brew cask install google-drive $brewupgrade
brew cask install transmission $brewupgrade

# clean the cache to save disk space
brew cask cleanup

# TO BE INSTALLED MANUALLY
# armagetron advanced
# sony bridge for mac
# pycharm community edition

# APP STORE
# radio centraal
# last pass
# xml nanny
