
#toon een mooier path
function path(){
    old=$IFS
    IFS=:
    printf "%s\n" $PATH
    IFS=$old
}

#genereer het path, en voeg alles van composer en mijn eigen scripts toe
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/mysql/bin
export PATH=~/.composer/vendor/bin/:$PATH
export PATH=~/wijs_scripts/:$PATH
export PATH=/opt/local/bin/:$PATH
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# snelle toetsen aub
defaults write NSGlobalDomain KeyRepeat -int 0

#voer de git autocompletion script uit
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#toon huidige branch in prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


alias g='git'


function tlpush_production() {
	export LANG="nl_NL.UTF-8";
	git push fortrabbit_production master
}

function tlpush_staging() {
        export LANG="nl_NL.UTF-8";
        git push fortrabbit_staging master
}
