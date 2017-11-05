# env. variable
export ZSH=/home/krisan/.oh-my-zsh
export GOPATH=/home/krisan/Documents/go

# improve escape speed in vim
KEYTIMEOUT=1

# zsh's theme and plugins
ZSH_THEME="philips"
plugins=(git)

# vim color scheme
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
source $ZSH/oh-my-zsh.sh

# sourcing of other files
source $HOME/zsh/aliases

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
