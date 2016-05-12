# == GO =================================================================
export GOPATH=~/Go


# == PATH ===============================================================
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

export PATH=~/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export PATH=~/wijs_scripts:$PATH
export PATH=/sbin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/opt/local/sbin:$PATH
export PATH=/usr/bin:/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/opt/go/libexec/bin:$PATH
export PATH=/usr/local/php5/bin:$PATH
export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
export PATH=$GOPATH/bin:$PATH


# == PYTHON =============================================================
# boot a django project in two iTerm panes
function dj() {
    if [ -z "$1" ]; then
        echo "Provide the name of the existing django project"
    elif [ ! -f ~/Python/$1/$1/manage.py ]; then
        echo "$1 is not an existing django project"
    else
        osascript <<-EOF
    tell application "iTerm"
        tell (current terminal)
            tell the current session to write text "cd ~/Python/$1/$1 && workon $1 && pycharm && python manage.py runserver"
            tell application "System Events" to keystroke "d" using command down
            tell the current session to write text "cd ~/Python/$1/$1 && workon $1"
        end tell
    end tell  
EOF
    fi
}


function pycharm() {
    /Applications/PyCharm\ CE.app/Contents/MacOS/pycharm ${PWD} > /dev/null 2>&1 & disown
}

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
export WORKON_HOME=~/Envs
export PROJECT_HOME=~/Python

source /usr/local/bin/virtualenvwrapper.sh

alias pm='python manage.py '



if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

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

alias start_postgres='pg_ctl -D /usr/local/var/postgres -l logfile start'


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
