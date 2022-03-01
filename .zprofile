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
export TERMINAL="alacritty"
export BROWSER="firefox"
export EDITOR="nvim"
export READER="zathura"
export GUI=1
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke
export NNN_OPTS="dex"
export NNN_COLORS="4321"
export NNN_PLUG_DEFAULT='f:fzopen;v:imgview;c:diffs;d:dragdrop'
export NNN_PLUG_INLINE='x:!chmod u+x $nnn;t:-!tree -a $nnn;u:!unlink $nnn;q:!qrcp -k $nnn'
export NNN_PLUG="$NNN_PLUG_DEFAULT;$NNN_PLUG_INLINE"
export NNN_BMS='h:~;p:~/Pictures'
BLK="03" CHR="03" DIR="04" EXE="02" REG="00" HARDLINK="06" SYMLINK="06" MISSING="07" ORPHAN="08" FIFO="06" SOCK="05" OTHER="07"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_TRASH=1
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--no-height
--no-reverse
--color=dark
--color=fg:-1,bg:-1,hl:#9ece6a,fg+:-1,bg+:-1,hl+:#e0af68
--color=info:#7aa2f7,prompt:#9ece6a,pointer:#f7768e,marker:#f7768e,spinner:#f7768e
--bind ctrl-b:preview-half-page-up,ctrl-f:preview-half-page-down
--bind ctrl-/:toggle-preview,ctrl-]:toggle-preview-wrap
'
export FZF_PREVIEW_OPTS="(bat {} || tree -C {}) 2> /dev/null"
export FZF_ALT_C_OPTS="--preview '$FZF_PREVIEW_OPTS'"
export FZF_CTRL_T_OPTS="--preview '$FZF_PREVIEW_OPTS'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:hidden:wrap"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
