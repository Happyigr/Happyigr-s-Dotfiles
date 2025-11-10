#!/bin/bash
sudo pacman -Sy --noconfirm \
  ranger firefox telegram-desktop ueberzugpp stow

sudo pacman -Rns --noconfirm \
  hey 1password-beta 1password-cli 

# Air installtion formatter for R
curl -LsSf https://github.com/posit-dev/air/releases/latest/download/air-installer.sh | sh

yay -Sy hyprmon-bin rstudio-desktop
