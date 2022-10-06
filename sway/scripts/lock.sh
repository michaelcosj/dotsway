#!/bin/bash

grimshot save screen /tmp/lock.png 1> /dev/null
magick /tmp/lock.png -blur 4x2 /tmp/lock_blur.png
swaylock -f -i /tmp/lock_blur.png
