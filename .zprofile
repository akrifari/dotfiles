# coloring man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# environment variables
export GOPATH=$HOME/Documents/golang
export PATH=$PATH:$GOPATH/bin
export TERMINAL="termite"
export BROWSER="firefox"
export EDITOR="nvim"
export READER="zathura"
export GUI=1
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke
export NNN_OPTS="ex"
export NNN_COLORS="4321"
export NNN_PLUG='f:fzopen;v:imgview'
export NNN_BMS='h:~;p:~/Pictures'
export FZF_DEFAULT_COMMAND="ag --hidden --path-to-ignore $HOME/.ignore -g ''"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
