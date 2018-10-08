#!/bin/zsh
setopt extendedglob
export ZSH=/home/rob/.oh-my-zsh
export EDITOR=/bin/nano
export VISUAL=/bin/nano
export CODING=${HOME}/Documents/Coding
export SUDO_ASKPASS=/usr/bin/ssh-askpass

ZSH_THEME="kiwi"

plugins=(battery colored-man-pages colorize common-aliases fast-syntax-highlighting git history sudo thefuck themes tmux torrent z zsh-autosuggestions zsh-completions zsh-navigation-tools)

autoload -U compinit && compinit

. /home/rob/.oh-my-zsh/plugins/z/z.sh

source $ZSH/oh-my-zsh.sh

if [[ -f $HOME/.zsh_functions ]]; then
	. $HOME/.zsh_functions
fi

alias ls="ls --color=auto --group-directories-first --file-type"

if [[ -f $HOME/.zsh_alias ]]; then
	. $HOME/.zsh_alias
fi

autoload -Uz predict-on zmv zed zcalc

export PATH=/home/rob/.local/bin:/home/rob/Documents/Coding/zsh:$PATH
export PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export TERM=xterm-256color
