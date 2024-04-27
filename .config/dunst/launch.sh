#!/usr/bin/env bash

# Dependencies:
# - dunst

pidof dunst && killall -q dunst
dunst &
