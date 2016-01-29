#!/bin/bash

# INSTALL ALL THE THINGS
# to update, add "update"

#@todo: 1. check if package managers exists, if not install
#@todo: 2. frontend stuff, gulp, bundler, npm, gem, ...
#@todo: 3. app store update
#@todo: 4. Auto install Apache, MySQL and PHP


# Update all package managers

# setup
# xcode-select --install
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# sudo chown <username> /usr/local/etc

brew upgrade
composer selfupdate
pip install --upgrade pip
brew install caskroom/cask/brew-cask


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

# BREW
brew install go
brew install git
brew install bash
brew install axel
brew install curl
brew install nmap 
brew install wget
brew install tmux
brew install php56
brew install figlet
brew install sqlite
brew install nodejs
brew install python
brew install python3
brew install macdown
brew install gettext
brew install composer
brew install postgresql
brew install php-code-sniffer
brew install imagemagick --with-librsvg

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
brew cask install slack $brewupgrade

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


# PIP
pip2 install $pipupgrade virtualenv
pip2 install $pipupgrade virtualenvwrapper
pip3 install $pipupgrade virtualenv
pip3 install $pipupgrade virtualenvwrapper

# TO BE INSTALLED MANUALLY
# armagetron advanced
# sony bridge for mac
# pycharm community edition

# APP STORE
# radio centraal
# last pass
# xml nanny
