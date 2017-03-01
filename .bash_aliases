# SYSTEM TOOLS
alias nfind="nano $HOME/Documents/Scripting/BASH/06-12/sh-finder.sh"
alias ndel="nano $HOME/Documents/Scripting/BASH/functionality/del"
alias test="la | grep ^- |  awk '{print $9}' | grep '^[.]'"
alias awkadd="awk '{s+=\$1} END {print s}'"
alias conv='/usr/local/bin/convert.exe'
alias cpu='cpuinfo'
alias df='df -kh'
alias du='du -kh'
alias catmem="cat /proc/meminfo"
alias h='history'
alias j='jobs -l'
alias ram='free'
alias backit='rsync -avz'
alias where='type -a'
alias which='type -a'
alias wiz='whereis'
# FUNCTION TOOLS
alias ..='cd ..'
alias balias="nano ~/.bash_aliases"
alias bfunc="nano ~/.bash_functions"
alias bwin="nano ~/.windows_functions"
alias chx='chmod +x'
alias find=/usr/bin/find
alias mv='mv -iv'
alias nnrc='nano ~/.nanorc'
alias rm='rm -iv'
alias shpr="nano  ~/.bash_profile"
alias shrc="nano  ~/.bashrc"
alias soursh="source ~/.bashrc ; source ~/.bash_profile"
# BASIC COMMAND TOOLS
alias cdd="cd .. && cd .."
alias cl="clear"
alias cls='clear ; ls'
alias cp="cp -iv"
alias desktop="cp $1 -t /cygdrive/c/Users/shambi07/Desktop"
alias diff='colordiff'
alias docx2txt='/usr/local/bin/docx2txt.sh'
alias firefox='firefox.exe'
alias foxit='foxitreader.exe'
#alias lsf="ls -l | grep ^- | awk '{print $9}'"
#alias lsfa="ls -lA| grep ^- | awk '{print $9}'"
alias ee=echo
alias md='mkdir -p'
alias more=less
alias n='nano '
alias nano='nano '
alias note='notepad++.exe'
alias paint='mspaint'
# LS TOOLS AND COLOR
alias dir='ls --format=verbose'
alias la="ls -lAh"
alias lc='ls -ltcr'             #  Sort by/show change time, most recent last.
alias ld='ls -CF'
alias lk='ls -lSr'              #  Sort by size, biggest last.
alias ll="ls -lh"
alias l="ls -gGhl"
alias lm='ll |more'             #  Pipe through 'more'
alias lsh='ls -o -n -h'
alias lsr='ls -sFh --si'
alias lt='ls -ltr'              #  Sort by date, most recent last.
alias lu='ls -ltur'             #  Sort by/show access time, most recent last.
alias lx='ls -lXB'              #  Sort by extension.
alias lr='ls -R'				#  Recursive ls
alias tree='tree -Csuh'
alias llr='ll -R'        		#  Recursive longlist
alias vdir='ls --format=long'
# SHORTCUTS
# ZIP TOOLS
alias tarmk='tar -cvf'
alias tarex='tar -xvf'
alias tarls='tar -tvf'
alias taradd='tar -rvf'
alias gz='gzip'
alias ungz='gunzip'
# GPG TOOLS
alias rmgpg='rm -iv *.gpg'
# WEB TOOLS
alias robladen='ncftp -u robladen -p Werebotion1! us4.siteground.us'
alias sshon='ssh robladen@southlaketech.in -p 18765'
# PORTABLE APPS SHORTCUTS
alias 7zip="7-ZipPortable.exe"
alias cpuz="CPU-ZPortable.exe"
alias daphne="DaphnePortable.exe"
alias diskclean="DiskCleanerPortable.exe"
alias exp="CubicExplorerPortable.exe"
alias geany="GeanyPortable.exe"
alias gpuz="GPU-ZPortable.exe"
alias gvim="gVimPortable.exe"
alias hdinfo="HWiNFOPortable.exe"
alias kompozer="KompoZerPortable.exe"
alias pciz="PCI-ZPortable.exe"
alias pnotes="PNotesPortable.exe"
alias procexp="ProcessExplorerPortable.exe"
alias prochack="ProcessHackerPortable.exe"
alias procmon="ProcessMonitorPortable.exe"
alias pwgen="PWGenPortable.exe"
alias raminfo="RAMMapPortable.exe"
alias registry="RegAlyzerPortable.exe"
alias rufus="RufusPortable.exe"
alias shell="mintty.exe"
alias ssdz="SSD-ZPortable.exe"
alias taskman="DTaskManagerPortable.exe"
alias thunderbird="ThunderbirdPortable.exe"
alias tray="RBTrayPortable.exe"
alias unetbootin="UNetbootinPortable.exe"
alias windirstat="WinDirStatPortable.exe"
alias yumi="YUMIPortable.exe"
















