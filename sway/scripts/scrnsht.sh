#!/bin/bash

pic_path="$HOME/Pictures/$(date +'%Y-%m-%d_%H-%M-%S').png"

grimshot save screen $pic_path

notify-send "Screenshot Saved" "$pic_path" -i "$pic_path" -h string:x-canonical-private-synchronous:screenshot
