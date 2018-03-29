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
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# history
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
setopt EXTENDED_GLOB

# path
export GOPATH=$HOME/Documents/golang
export PATH=$PATH:$HOME/.rvm/bin:$GOPATH/bin

# auto suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# informative git prompt
source $HOME/zsh/prompt/zshrc.sh
# PROMPT='%{$fg_bold[green]➜%}%{${reset_color} %}%B%~%b$(git_super_status) '
