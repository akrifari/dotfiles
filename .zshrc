# init
export ZSH=$HOME/.oh-my-zsh

# theme
ZSH_THEME="edvardm"

# plugin
plugins=(zsh-syntax-highlighting)

# delay timeout
KEYTIMEOUT=1

# utils
source $ZSH/oh-my-zsh.sh
source $HOME/zsh/functions
source $HOME/zsh/aliases

# history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
setopt EXTENDED_GLOB

# coloring man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# path
export GOPATH=$HOME/Documents/golang
export PATH=$PATH:$HOME/.rvm/bin:$GOPATH/bin
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'

# auto suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# informative git prompt
source $HOME/zsh/prompt/zshrc.sh
# PROMPT='%{$fg_bold[green]➜%}%{${reset_color} %}%B%~%b$(git_super_status) '
