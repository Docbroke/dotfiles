# ~/.bashprompt

# PS1 CONFIG {{{
function __prompt_command() {
	local EXIT="$?"

	local RCol='\[\e[0m\]'	# Text Reset

	# Regular					Bold						Underline					High Intensity				BoldHigh Intensity			Background				High Intensity Backgrounds
	local Bla='\[\e[0;30m\]';	local BBla='\[\e[1;30m\]';	local UBla='\[\e[4;30m\]';	local IBla='\[\e[0;90m\]';	local BIBla='\[\e[1;90m\]';	local On_Bla='\e[40m';	local On_IBla='\[\e[0;100m\]';
	local Red='\[\e[0;31m\]';	local BRed='\[\e[1;31m\]';	local URed='\[\e[4;31m\]';	local IRed='\[\e[0;91m\]';	local BIRed='\[\e[1;91m\]';	local On_Red='\e[41m';	local On_IRed='\[\e[0;101m\]';
	local Gre='\[\e[0;32m\]';	local BGre='\[\e[1;32m\]';	local UGre='\[\e[4;32m\]';	local IGre='\[\e[0;92m\]';	local BIGre='\[\e[1;92m\]';	local On_Gre='\e[42m';	local On_IGre='\[\e[0;102m\]';
	local Yel='\[\e[0;33m\]';	local BYel='\[\e[1;33m\]';	local UYel='\[\e[4;33m\]';	local IYel='\[\e[0;93m\]';	local BIYel='\[\e[1;93m\]';	local On_Yel='\e[43m';	local On_IYel='\[\e[0;103m\]';
	local Blu='\[\e[0;34m\]';	local BBlu='\[\e[1;34m\]';	local UBlu='\[\e[4;34m\]';	local IBlu='\[\e[0;94m\]';	local BIBlu='\[\e[1;94m\]';	local On_Blu='\e[44m';	local On_IBlu='\[\e[0;104m\]';
	local Pur='\[\e[0;35m\]';	local BPur='\[\e[1;35m\]';	local UPur='\[\e[4;35m\]';	local IPur='\[\e[0;95m\]';	local BIPur='\[\e[1;95m\]';	local On_Pur='\e[45m';	local On_IPur='\[\e[0;105m\]';
	local Cya='\[\e[0;36m\]';	local BCya='\[\e[1;36m\]';	local UCya='\[\e[4;36m\]';	local ICya='\[\e[0;96m\]';	local BICya='\[\e[1;96m\]';	local On_Cya='\e[46m';	local On_ICya='\[\e[0;106m\]';
	local Whi='\[\e[0;37m\]';	local BWhi='\[\e[1;37m\]';	local UWhi='\[\e[4;37m\]';	local IWhi='\[\e[0;97m\]';	local BIWhi='\[\e[1;97m\]';	local On_Whi='\e[47m';	local On_IWhi='\[\e[0;107m\]';
	### End Color Vars ### }}}

	# Useful Definition
    HOST="\h"					#   The hostname, up to the first ‘.’. 
    USER="\u"					#   The username of the current user. 
    DIR="\w"					#	The current working directory, with $HOME abbreviated with a tilde
    NEWLINE="\n"				#   A newline. 
    DATE="\d"					#	The date, in "Weekday Month Date" format
    TIME_ALL="\t" 				#   The time, in 24-hour HH:MM:SS format. 
    TIME_SH="\@" 				#   The time, in 12-hour am/pm format. 
    HIST_NUM="\!"				#	The history number of this command.
    CUR_USER="\$"				#	If the effective uid is 0, #, otherwise $. 
    ### END Useful Definition ### }}}

    if [ "${EXIT}" -eq 0 ]
    then
		PS1="\n┌─${On_IGre}[${USER}]${RCol} ${Blu}(${TIME_SH})${RCol}-${Red}(${DATE})${RCol} ${Whi}[${DIR}]${RCol}\n└─ ${CUR_USER} "
    else
		PS1="${BIRed}\n┌─[${USER}] (${TIME_SH})-(${DATE}) !${HIST_NUM}! [${DIR}]\n└─ ${CUR_USER}${RCol} "
	fi
}

PROMPT_COMMAND=__prompt_command	
