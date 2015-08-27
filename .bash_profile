export NVM_DIR="/Users/stefbastiaansen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#show a magnificent path
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

#generate path
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/mysql/bin
export PATH=~/.composer/vendor/bin/:$PATH
export PATH=~/wijs_scripts/:$PATH
export PATH=/opt/local/bin/:$PATH
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH=/usr/local/php5/bin:$PATH
export PATH=~/bin/:$PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

#use git autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

source ~/.symfony2_autocomplete.bash

#show the current branch in the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#prompt
export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

#fix for mysql and python
# export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

#This commamd allow for a very special and short version of the git command. Instead of typing "git" I can now type "g". Which is shorter.
alias g='git'

alias ac='app/console'
alias pm='python manage.py '

alias sakg='sudo apachectl -k graceful'

alias sonar-qube='/usr/local/sonarqube/bin/macosx-universal-64/sonar.sh'
alias sonar-runner='/usr/local/sonar-runner/bin/sonar-runner'

#clear cache in Fork CMS
alias cc='./tools/remove_cache'


function plnrr() {
	app/console doctrine:schema:update --force
	app/console doctrine:generate:entities MegasnortPlnrBundle
	app/console doctrine:fixtures:load -n
}

#python env
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export JAVA_HOME=/usr/bi
