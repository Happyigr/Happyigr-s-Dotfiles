#!/bin/bash

notify-send "Language changed" "$(hyprctl devices -j | jq -r '.keyboards[] | select(.main == true) | .active_keymap')"

