#!/usr/bin/sh

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar master 2>&1 | tee -a /tmp/polybar1.log & disown

monitors=$(polybar --list-monitors | cut -d":" -f1)

for monitor in $monitors; do
	if [ $monitor == "HDMI-1" ]; then
		MONITOR=$monitor polybar --reload master 2>&1 | tee -a /tmp/master.log & disown
	else
		echo $monitor
		MONITOR=$monitor polybar --reload slave 2>&1 | tee -a /tmp/slave.log & disown
	fi
done
echo "Bars launched..."
