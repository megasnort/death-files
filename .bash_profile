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

export NVM_DIR="/Users/stefbastiaansen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#generate path
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/mysql/bin
export PATH=~/.composer/vendor/bin/:$PATH
export PATH=~/wijs_scripts/:$PATH
export PATH=/opt/local/bin/:$PATH
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH=/usr/local/php5/bin:$PATH
export PATH=~/bin/:$PATH

#use git autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

source ~/.symfony2_autocomplete.bash


alias g='git'
alias ac='app/console'
alias pm='python manage.py '
alias sar='sudo apachectl restart'

#clear cache in Fork CMS
alias cc='./tools/remove_cache'


#show the current branch in the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#prompt
export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
