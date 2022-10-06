#!/bin/bash

curr_vol="$(pactl list sinks | grep '^[[:space:]]Volume:' | \
  head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')"

if [ "$1" = "inc" ] && [ $curr_vol -lt 100 ]; then
  pactl set-sink-volume @DEFAULT_SINK@ +5%;
elif [ "$1" = "dec" ] && [ $curr_vol -gt 0 ]; then
  pactl set-sink-volume @DEFAULT_SINK@ -5%;
elif [ "$1" = "mute" ]; then
  pactl set-sink-mute @DEFAULT_SINK@ toggle 
fi

curr_vol="$(pactl list sinks | grep '^[[:space:]]Volume:' | \
  head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')%"

ismuted="$(pactl list sinks | grep '^[[:space:]]Mute:' | awk -F: '{print $2}')"

icon="audio-volume-medium"

if [ "$ismuted" = " yes" ]; then
  icon="audio-volume-muted"
  curr_vol="muted"
else 
  if [ $curr_vol -gt 70 ]; then
    icon="audio-volume-high"
  elif [ $curr_vol -lt 30 ]; then
    icon="audio-volume-low"
  fi
fi



notify-send "Volume: $curr_vol" -i "$icon" -h string:x-canonical-private-synchronous:volume


