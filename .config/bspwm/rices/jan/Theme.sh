#!/usr/bin/env bash
#  ╔═╗╦ ╦╔╗╔╔╦╗╦ ╦╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ║  ╚╦╝║║║ ║ ╠═╣║╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝ ╩ ╝╚╝ ╩ ╩ ╩╩╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.
xrdb ~/.Xresources
include-file = ../../scripts/colors.ini

# Set bspwm configuration for Cynthia
bspc config border_width 5
bspc config top_padding 80
bspc config bottom_padding 2
bspc config focused_border_color "#aaaaaa"
bspc config normal_border_color "#333333"
# bspc config active_border_color "#974EC3"
# bspc config presel_feedback_color "#3f5273"
bspc config left_padding 2
bspc config right_padding 2
bspc config window_gap 10


# Launch the bar
polybar -q pam1 -c $HOME/.config/bspwm/rices/jan/config.ini &
polybar -q pam2 -c $HOME/.config/bspwm/rices/jan/config.ini &
polybar -q pam3 -c $HOME/.config/bspwm/rices/jan/config.ini &
