#!/bin/sh
# source xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# pywal + xrdb
wal -R >/dev/null 2>&1
xrdb -merge ~/.Xresources

# start picom compositor
picom --config ~/.config/picom/picom.conf &

# start dwmblocks
while true; do
    dwmblocks >/dev/null 2>&1
done &

# start dwm
while true; do
    dwm >/dev/null 2>&1
done
