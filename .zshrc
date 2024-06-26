# start i3
if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep i3 || exec startx
fi

# init
export ZSH=$HOME/.oh-my-zsh

# theme
ZSH_THEME="fwalch"

# utils
source $ZSH/oh-my-zsh.sh
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

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
