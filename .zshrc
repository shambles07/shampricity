export ZSH=/home/shambi07/.oh-my-zsh
pathfix=$(echo "${PWD}" | /usr/bin/sed 's|/cygdrive/c/|C://|g;s/\//\\/g')
export pathfix

ZSH_THEME="fox"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(zsh-autosuggestions theme git)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_alias
source $HOME/.zsh_functions
#source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#alias ls='ls --file-type --group-directories-first --color=auto'
alias grep='grep --color=auto'

# echo ${ZDOTDIR:-$HOME}/.zkbd/
setopt BRACE_CCL COMPLETE_ALIASES
APTS=( $(apt-cyg list ".*") )
MY_IP="50.178.83.159"