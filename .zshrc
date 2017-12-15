# init
export ZSH=/home/krisan/.oh-my-zsh

# theme
ZSH_THEME="philips"

# plugin
plugins=(git)

# delay timeout
KEYTIMEOUT=1

# utils
source $ZSH/oh-my-zsh.sh
source $HOME/zsh/aliases
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

# path
export GOPATH=$HOME/Documents/golang
export PATH=$PATH:$HOME/.rvm/bin:$GOPATH/bin

# auto suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
