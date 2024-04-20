[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

[[ -f ~/.xmodmaprc ]] && xmodmap ~/.xmodmaprc

exec i3
