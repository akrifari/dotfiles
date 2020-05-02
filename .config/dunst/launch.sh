#!/usr/bin/env bash

pidof dunst && killall -q dunst
dunst &
