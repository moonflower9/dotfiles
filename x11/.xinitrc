#!/bin/sh

# source xprofile (WALLPAPER, display etc.)
[ -f ~/.xprofile ] && . ~/.xprofile

# start picom compositor
picom --config ~/.config/picom/picom.conf &

# set colorscheme with wal + merge with xrdb + cursor
wal -i "$WALLPAPER" -q
xrdb -merge ~/.cache/wal/colors.Xresources
xrdb -merge ~/.cache/wal/dwm
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
