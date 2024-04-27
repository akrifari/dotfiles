#!/usr/bin/sh

# Dependencies:
# - xorg-xrandr
# - dunst

monitor=$(xrandr | grep "eDP1" | cut -d " " -f 1)
ext_monitor=$(xrandr | awk "/ connected/ && ! /$monitor/" | cut -d " " -f 1 | head -n 1)

if [ "$ext_monitor" =  "" ]; then
  dunstify -u low "There is no external monitor connected"
  exit 1
fi

if [ "$ext_monitor" = "DP1" ]; then
  size="800x600"
else
  size="1280x720"
fi

case $1 in
  -s)
    xrandr --output $monitor --mode $size --output $ext_monitor --same-as $monitor --mode $size
    dunstify "External monitor same as primary"
    ;;
  -h)
    xrandr --output $ext_monitor --mode $size --left-of $monitor
    dunstify "External monitor left of primary"
    ;;
  -l)
    xrandr --output $ext_monitor --mode $size --right-of $monitor
    dunstify "External monitor right of primary"
    ;;
  -r)
    xrandr --output $ext_monitor --off --output $monitor --mode $size
    dunstify "Only display primary monitor"
    ;;
esac
