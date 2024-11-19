#!/usr/bin/env bash
#  ╔═╗╦ ╦╔╗╔╔╦╗╦ ╦╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ║  ╚╦╝║║║ ║ ╠═╣║╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝ ╩ ╝╚╝ ╩ ╩ ╩╩╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Cynthia
bspc config border_width 3
bspc config top_padding 45
bspc config bottom_padding 45
bspc config normal_border_color "#3C0753"
# bspc config active_border_color "#974EC3"
bspc config focused_border_color "#910A67"
# bspc config presel_feedback_color "#3f5273"
bspc config left_padding 2
bspc config right_padding 2
bspc config window_gap 10

killall -q -w picom
killall -q -w sxhkd
killall -q -w polybar

# Picom
picom --config $HOME/.config/bspwm/rices/cynthia/picom.conf &
# Launch the bar
polybar -q cyn-bar -c $HOME/.config/bspwm/rices/cynthia/config.ini &
polybar -q cyn-bar2 -c $HOME/.config/bspwm/rices/cynthia/config.ini &
