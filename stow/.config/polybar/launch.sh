#!/usr/bin/sh

polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar_master.log /tmp/polybar_slave.log

PRIMARY_MONITOR=$(xrandr --query | awk '/ primary/{print $1}')

if [ -z "$PRIMARY_MONITOR" ]; then
    PRIMARY_MONITOR=$(polybar --list-monitors | head -n1 | cut -d":" -f1)
fi

ALL_MONITORS=$(polybar --list-monitors | cut -d":" -f1)

MONITOR=$PRIMARY_MONITOR polybar --reload master 2>&1 | tee -a /tmp/polybar_master.log & disown

for monitor in $ALL_MONITORS; do
    if [ "$monitor" != "$PRIMARY_MONITOR" ]; then
        MONITOR=$monitor polybar --reload slave 2>&1 | tee -a /tmp/polybar_slave.log & disown
    fi
done

echo "Bars launched..."

