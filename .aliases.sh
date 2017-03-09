##################
### ALIAS FILE ###
##################

## basic bash ##
alias ls='ls --color=auto'
alias x=exit
alias i3="startx /usr/bin/i3"
alias free="free -h"
alias grep='grep --color=auto'
alias hgrep="history | grep"
alias fbterm='fbterm -n Inconsolata -s 22'

## pacman & pacaur ##
alias pacsyu="sudo pacman -Syu"	    # update database & upgrade
alias pacsy="sudo pacman -Sy"	    # update only
alias pacsu="sudo pacman -Su"	    # upgrade only
alias pacs="sudo pacman -S"	    # sync (install)
alias pacss="sudo pacman -Ss"	    # search package
alias pacsi="pacman -Si"	    # details of the package
alias pacqs="pacman -Qs"	    # search locally installed package
alias pacq="pacman -Q"		    # version information
alias pacqi="pacman -Qi"	    # details of the installed package
alias pacql="pacman -Ql"	    # list all files of the package
alias pacrs="sudo pacman -Rs"	    # remove package not leaving orphans
alias pacr="sudo pacman -R"	    # only remove selected package
alias pacrns="sudo pacman -Rns"	    # remove (not leaving any orphans) == clean removal + remove configs
alias pacrdd="sudo pacman -Rdd"	    # remove packages (breaking dependencies)
alias pacqm="pacman -Qm"	    # packages installed from aur
alias pacqo="pacman -Qo"	    # file owned by $package
alias pacqkk="pacman -Qkk"	    # check for any altered files

## Browser ##
alias w3m="w3m -v"
alias w3b="w3m -B"
alias lariza="lariza -T"

alias wiki=wiki-search
alias wikih=wiki-search-html

## use "command | ptpb" or "ptpb < file/image"
alias ptpb='curl -F c=@- https://ptpb.pw/'
## alternative to ptpb
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

## for DICTIONARY ##
alias def='sdcv --data-dir ~/dic/extra'
alias hindi='sdcv --data-dir ~/dic/hindi'
alias sanskrit='sdcv --data-dir ~/dic/sanskrit'

alias units="units -v"
