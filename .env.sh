## PROMPT ##
#export PS1="\n\[\033[1;31m\]┌─\[\033[1;34m\][\d]\[\033[34m\][\t]\[\033[33m\][\w]\n\[\033[31m\]└─╼ \[\033[0m\]"
export PS2=»

# PATH # 
PATH=${HOME}/bin:${PATH}
PATH=/usr/lib/surfraw:${PATH}
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DOWNLOAD_DIR="$HOME/.Downloads"
export LARIZA_DOWNLOAD_DIR=/home/sharad/Downloads
export LARIZA_HOME_URI=file:///home/sharad/.w3m/bookmark.html
export LARIZA_HISTORY_FILE=/home/sharad/.config/lariza/history

## HISTORY ##
export HISTCONTROL=ignoreboth  ## duplicates and line beginning with empty space
export HISTSIZE=10000

## BASIC VARIABLES ##
export TERMINAL=st
export PAGER=less
export EDITOR=vim

if [ -n "$DISPLAY" ]; then
    export VIEWER=sxiv
else
    export VIEWER=fbi
fi

## for wiki-search ##
if [ -n "$DISPLAY" ]; then
    export wiki_browser=lariza
else
    export wiki_browser=w3m
fi

## for gpg-agent ###
export GPG_TTY=$(tty)
