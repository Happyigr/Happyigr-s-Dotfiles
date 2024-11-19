#!/usr/bin/env bash

DIR="$HOME/.config/bspwm/assets"

# Array of languages
layouts=("us,ru,de" "ru,de,us" "de,us,ru")
languages=("us" "ru" "de")
icon="$DIR/keyboard.png"

# Get the current active language
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')
locale="${current_layout:0:2}"

# Find the index of the current language in the array
current_index=0
for i in "${!languages[@]}"; do
    if [[ "${languages[$i]}" == "${locale}" ]]; then
        current_index=$i
        break
    fi
done

case $1 in 
  prev)
    next_index=$(( (current_index - 1) % ${#languages[@]} ))
    ;;
  next)
    next_index=$(( (current_index + 1) % ${#languages[@]} ))
    ;;
esac


next_language=${languages[$next_index]}
setxkbmap -layout ${layouts[$next_index]}
dunstify "$next_language" -r 5554 -u normal -i $icon
# Set the new language

