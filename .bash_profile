
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

#use git autocompletion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#show the current branch in the prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#prompt
export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

#This commamd allow for a very special and short version of the git command. Instead of typing "git" I can now type "g". Which is shorter.
alias g='git'

#clear cache in Fork CMS
alias cc='./tools/remove_cache'


#custom stuff for deploying to a fortrabbit server
function tlpush_production() {
	export LANG="nl_NL.UTF-8";
	git push fortrabbit_production master
}

function tlpush_staging() {
        export LANG="nl_NL.UTF-8";
        git push fortrabbit_staging master
}