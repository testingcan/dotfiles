#!/usr/bin/env sh

# Kill running polybar
killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
/home/raphael/.config/polybar/./launch.sh --docky
