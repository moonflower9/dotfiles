#!/bin/sh
# Post-wal hook: reload apps that use pywal colors
# Run via: wal -i <image> -o ~/.config/wal/post-hook.sh

# Reload waybar CSS (picks up new @import colors from ~/.cache/wal/colors-waybar.css)
killall waybar 2>/dev/null
sleep 0.2
nohup waybar --config "$HOME/.config/waybar/config.jsonc" >/dev/null 2>&1 &

# Reload foot terminal colors (SIGUSR1 re-reads foot.ini + includes)
killall -SIGUSR1 foot 2>/dev/null

# Merge X resources if running under X11
xrdb -merge ~/.cache/wal/colors.Xresources 2>/dev/null
