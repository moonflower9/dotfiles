#!/bin/sh
# source xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# pywal + xrdb
wal -R >/dev/null 2>&1
xrdb -merge ~/.Xresources

# start dwm
while true; do
    dwm >/dev/null 2>&1
done

# start dwmblocks
exec dwmblocks
