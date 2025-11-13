#!/bin/bash
pacman -Sy --noconfirm 

pacman -Rns --noconfirm 

# Air installtion formatter for R
curl -LsSf https://github.com/posit-dev/air/releases/latest/download/air-installer.sh | sh

yay -Sy --noconfirm hyprmon-bin rstudio-desktop
