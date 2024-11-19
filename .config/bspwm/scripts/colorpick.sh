#!/usr/bin/env bash

# Function to generate color block
generate_color_block() {
  local color="$1"
  local red=$((16#${color:1:2}))
  local green=$((16#${color:3:2}))
  local blue=$((16#${color:5:2}))
  # ANSI escape code for setting background color
  printf "\e[48;2;%d;%d;%dm█\e[0m" $red $green $blue
}

killall gpick

color_code=$(gpick -so)
# Generating the colored block for notification
convert -size 64x64 xc:"$color_code" ~/.config/bspwm/assets/colored_block.png &

xclip -selection clipboard <<< "$color_code"
dunstify -i ~/.config/bspwm/assets/colored_block.png "$color_code" "Copied in clipboard"

echo -e "Notification sent with color code: $color_code"
