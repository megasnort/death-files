# == GO =================================================================
export GOPATH=~/Go


# == PATH ===============================================================
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

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
export PATH=/usr/local/opt/go/libexec/bin:$PATH
export PATH=/usr/local/php5/bin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PATH=$GOPATH/bin:$PATH


# == PYTHON =============================================================
# boot a django project in a tmux session with the server on top
function dj() {
    if [ -z "$1" ]; then
        echo "Provide the name of the existing django project"
    elif [ ! -f ~/Python/$1/$1/manage.py ]; then
        echo "$1 is not an existing django project"
    else
        tmux new-session -d
        tmux split-window -d -t 0 -v

        tmux send-keys -t 0 "cd $PROJECT_HOME/$1/$1" enter C-l
        tmux send-keys -t 0 "workon $1" enter C-l
        tmux send-keys -t 0 "python manage.py runserver" enter

        tmux send-keys -t 1 "cd $PROJECT_HOME/$1/$1" enter C-l
        tmux send-keys -t 1 "workon $1" enter C-l
        tmux select-pane -t 1

        tmux attach
    fi
}

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
export WORKON_HOME=~/Envs
export PROJECT_HOME=~/Python

source /usr/local/bin/virtualenvwrapper.sh

alias pm='python manage.py '


# == PHP ================================================================
function sfreset() {
    app/console doctrine:schema:update --force
    app/console doctrine:fixtures:load -n
    app/console cache:clear
}

source ~/.symfony2_autocomplete.bash
alias ac='app/console'
alias cc='./tools/remove_cache' #FORK CMS
alias yolo='cap production deploy'


# == RUBY ===============================================================
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


# == APACHE =============================================================
alias sakg='sudo apachectl -k graceful'
alias sar='sudo apachectl restart'


# == POSTGRES ===========================================================
function mkpostgres() {
    createuser --pwprompt $1
    createdb -O$1 -Eutf8 $1
}

alias start_postgres='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'


# == GIT ================================================================
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias g='git'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


# == ITUNES =============================================================
function itns() {
    lsof +D ~/Music/iTunes/iTunes\ Music/ -i | grep iTunes
}


# == TMUX ===============================================================
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux
