#!/bin/bash
echo "Creating mirrorlist backup..."
sleep 1
rm /etc/pacman.d/mirrorlist.*
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
echo "Creating new mirrorlist..."
sleep 1
reflector --verbose --country 'Germany' --latest 10 --sort rate --save /etc/pacman.d/mirrorlist
sleep 1
echo "Refreshing package list...Syy"
sleep 1
pacman -Syy
