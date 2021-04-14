#!/bin/bash

killall -q feh
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# change wallpaper periodically
while true 
do
  feh --randomize --bg-fill ~/.wallpaper/active/*
  sleep 30m
done

