#!/usr/bin/env sh
killall nitrogen
xwinwrap -ov -fs -fdt -ni -b -nf -- livestream.sh %WID
nitrogen --restore
