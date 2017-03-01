[[ "$-" != *i* ]] && return

# SET SHELL OPTIONS

export PROMPT_COMMAND="history -a"
export DISPLAY=:0.0
export EDITOR=/usr/bin/nano
export PATH=$PATH:/sbin:/usr/sbin:/usr/bin:/usr/local/bin/:/home/shambi07/bin/
export PS1='\[\033[01;36m\]\u@\h|\[\033[01;32m\]\w/\n$\[\033[00m\] '
export HISTCONTROL=ignoreboth:erasedups

shopt -s nocaseglob
shopt -s histappend
shopt -s cdspell

# SET ENV VARS FOR EASE OF USE

# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# export HISTCONTROL=ignoredups

#export PS1="\033]0;${PWD}\n\033[32m${USER}@${HOSTNAME} \033[33m${PWD}/\033[0m\n$ "
# THIS IS THE ORIGINAL PS1 FROM CYGWIN /ETC/PROFILE
#
#export PS1="\[$(tput bold)$(tput setb 3)$(tput setaf 7)\]\u@\h:\w $ \[$(tput sgr0)\]"
#export PS1="|\@| \w> "
#PS1 Colors
#GREEN="\[$(tput setaf 2)\]"
#export PS1="$GREEN\u@\h:\W\\$ "

# SOURCE OUR ALIASES AND FUNCTIONS

if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi

if [ -f "${HOME}/.bash_functions" ]; then
  source "${HOME}/.bash_functions"
fi

# SEPARATE THE WINDOWS SPECIFIC FUNCTIONS FROM UNIX ONES

if [ -f "${HOME}/.windows_functions" ]; then
  source "${HOME}/.windows_functions"
fi

# ADD PORTABLEAPPS PATH TO PATH

if [ -f "${HOME}/.portable_path" ]; then
  source "${HOME}/.portable_path"
fi

# ADD PORTABLEAPPS ALIASES TO PATH

if [ -f "${HOME}/.portapps" ]; then
  source "${HOME}/.portapps"
fi

function addcolor()
{
	printf "%s\n" "
	# Function Colors
	Black='\e[0;30m'        # Black
	Red='\e[0;31m'          # Red
	Green='\e[0;32m'        # Green
	Yellow='\e[0;33m'       # Yellow
	Blue='\e[0;34m'         # Blue
	Purple='\e[0;35m'       # Purple
	Cyan='\e[0;36m'         # Cyan
	White='\e[0;37m'        # White
	# Bold
	BBlack='\e[1;30m'       # Black
	BRed='\e[1;31m'         # Red
	BGreen='\e[1;32m'       # Green
	BYellow='\e[1;33m'      # Yellow
	BBlue='\e[1;34m'        # Blue
	BPurple='\e[1;35m'      # Purple
	BCyan='\e[1;36m'        # Cyan
	BWhite='\e[1;37m'       # White
	# Background
	On_Black='\e[40m'       # Black
	On_Red='\e[41m'         # Red
	On_Green='\e[42m'       # Green
	On_Yellow='\e[43m'      # Yellow
	On_Blue='\e[44m'        # Blue
	On_Purple='\e[45m'      # Purple
	On_Cyan='\e[46m'        # Cyan
	On_White='\e[47m'       # White
	NC="\\e[m"               # Color Reset
	"
}

# Personal Aliases

alias less='less -r'                            # raw control characters
alias whe='type -a'                             # where, of a sort
alias grep='grep --color="auto"'                # show differences in colour
alias egrep='egrep --color=auto'                # show differences in colour
alias fgrep='fgrep --color=auto'                # show differences in colour
alias ls='ls --file-type --group-directories-first --color=tty'                   # colorize ls
alias cd..='cd_up'                              # shortcut for the command
alias sl=ls

# REMOVING CRONTAB SERVICES
# TO REMOVE A CRONTAB SERVICE, USE THE FOLLOWING COMMAND
# cygrunsrv -R commandname, only one running is cron so
# cygrunsrv -R cron ; that would remove the cron service
# from running on Windows. It's kind of neat to have it
# running though.

 [[ -f /etc/bash_completion ]] && . /etc/bash_completion
