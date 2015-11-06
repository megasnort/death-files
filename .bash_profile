# who listens to my itunes
function itns() {
    lsof +D ~/Music/iTunes/iTunes\ Music/ -i | grep iTunes
}

#reinit a symfony project
function sfreset() {
    app/console doctrine:schema:update --force
    app/console doctrine:fixtures:load -n
    app/console cache:clear
}

#show complete path in a readable way
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

function plnrr() {
    app/console doctrine:schema:update --force
    app/console doctrine:generate:entities MegasnortPlnrBundle
    app/console doctrine:fixtures:load -n
}

function mkpostgres() {
    createuser --pwprompt $1
    createdb -O$1 -Eutf8 $1
}

#generate path
export PATH=~/bin/:$PATH
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/mysql/bin
export PATH=/usr/local/php5/bin:$PATH

export PATH=~/.composer/vendor/bin/:$PATH
export PATH=~/wijs_scripts/:$PATH
export PATH=/opt/local/bin/:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

export PATH=$PATH:/usr/local/opt/go/libexec/bin

export PATH=/usr/local/php5/bin:$PATH


# fix for mysql and python
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

#python env
export WORKON_HOME=~/Envs


# use git autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

source ~/.symfony2_autocomplete.bash


export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python

source /usr/local/bin/virtualenvwrapper.sh

alias g='git'
alias ac='app/console'
alias pm='python manage.py '
alias sonar-runner='/usr/local/sonar-runner/bin/sonar-runner'

alias sakg='sudo apachectl -k graceful'
alias sar='sudo apachectl restart'
alias sonar-qube='/usr/local/sonarqube/bin/macosx-universal-64/sonar.sh'
alias cc='./tools/remove_cache' #FORK
alias yolo='cap production deploy'

# PROMPT
#show the current branch in the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


export GOPATH=~/Go
export PATH=$PATH:$GOPATH/bin


#NVM
#export NVM_DIR="~/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" 

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


