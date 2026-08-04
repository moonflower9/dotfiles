#!/bin/sh

# source xprofile (WALLPAPER, display etc.)
[ -f ~/.xprofile ] && . ~/.xprofile

# start picom compositor + make sure it has time to start
picom --config ~/.config/picom/picom.conf &
sleep 0.5

# set colorscheme with wal + merge with xrdb + cursor
wal -i "$WALLPAPER" -q
xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr

# set wallpaper
feh --bg-scale "$WALLPAPER"

# start dwmblocks
while true; do
    dwmblocks >/dev/null 2>&1
done &

# start dwm
while true; do
    dwm >/dev/null 2>&1
done
