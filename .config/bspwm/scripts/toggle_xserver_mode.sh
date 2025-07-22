#!/bin/bash

RESTART_MODE=$(cat ~/.config/bspwm/restart_mode 2>/dev/null)
if [[ $RESTART_MODE = "remote" ]]; then
  echo "local" > /home/popich/.config/bspwm/restart_mode
else
  echo "remote" > /home/popich/.config/bspwm/restart_mode
fi
bspc quit &
startx &
