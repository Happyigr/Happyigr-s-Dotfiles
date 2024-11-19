#!/usr/bin/env bash

killall picom
bspc config top_padding 0 
bspc config left_padding 0 
bspc config right_padding 0
bspc config bottom_padding 0 
bspc config window_gap 0 
bspc config border_width 1
polybar-msg cmd hide
picom --config ~/.config/bspwm/picom_focus_mode.conf
