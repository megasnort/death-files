# who listens to my itunes
function itns() {
    lsof +D ~/Music/iTunes/iTunes\ Music/ -i | grep iTunes
}

function plnr() {
	cd ~/Sites/plnr-django/plnr/
	workon plnr
}

function lijsttrekkers() {
    cd ~/Sites/lijsttrekkers_django/lijsttrekkers/
    workon lijsttrekkers
}

# Reinit a symfony project
function sfreset() {
    app/console doctrine:schema:update --force
    app/console doctrine:fixtures:load -n
    app/console cache:clear
}

# Show complete path in a readable way
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

# POSTGRES
function mkpostgres() {
    createuser --pwprompt $1
    createdb -O$1 -Eutf8 $1
}

# GO
export GOPATH=~/Go

# PYTHON
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
export WORKON_HOME=~/Envs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

source /usr/local/bin/virtualenvwrapper.sh

alias pm='python manage.py '

# PHP
source ~/.symfony2_autocomplete.bash
alias ac='app/console'
alias cc='./tools/remove_cache' #FORK CMS

# APACHE
alias sakg='sudo apachectl -k graceful'
alias sar='sudo apachectl restart'


#GIT
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias g='git'

#show the current branch in the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


# PATH
export PATH=~/bin/:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export PATH=~/wijs_scripts:$PATH
export PATH=/sbin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/sbin:$PATH
export PATH=/usr/bin:/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/php5/bin:$PATH
export PATH=/usr/local/opt/go/libexec/bin:$PATH
export PATH=/usr/local/php5/bin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PATH=$GOPATH/bin:$PATH


