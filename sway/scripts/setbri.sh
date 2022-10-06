#!/bin/bash

if [ "$1" = "inc" ]; then
  brightnessctl set +5%
elif [ "$1" = "dec" ]; then
  brightnessctl set 5%-
fi
curr_bri=$(brightnessctl -m info | awk '{split($0,a,","); print a[4]}')
notify-send "Brightness: $curr_bri" -h string:x-canonical-private-synchronous:brightness


