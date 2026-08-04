#!/bin/sh
cpu_icon=$(printf '\xef\x8b\x87 ')
ram_icon=$(printf '\xee\xbf\x85 ')
disk_icon=$(printf '\xf3\xb0\x8b\x9c ')
clock_icon=$(printf '\xf3\xb0\xa5\x94 ')

delim="   "
i=0
cpu=""
ram=""
disk=""
clock=""

while :; do
    [ $((i % 5)) -eq 0 ] && cpu="${cpu_icon}$(sensors | awk '/Tctl:/ {print $2}' | tr -d '+')"
    [ $((i % 5)) -eq 0 ] && ram="${ram_icon}$(free -h | awk '/^Mem:/ {print $3}')"
    [ $((i % 30)) -eq 0 ] && disk="${disk_icon}$(df -h / | awk 'NR==2 {print $3}')"
    [ $((i % 5)) -eq 0 ] && clock="${clock_icon}$(date '+%a, %b %d  %I:%M %p')"
    printf '%s%s%s%s%s%s%s\n' "$cpu" "$delim" "$ram" "$delim" "$disk" "$delim" "$clock"
    i=$((i + 1))
    sleep 1
done
