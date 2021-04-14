#!/bin/bash
step=$1 # in percentage, e.g. "2%"
plus_minus=$2 # must be "+" or "-"

# find out the sinks that are currently playing sound
sink_idx=`pacmd list-sink-inputs | awk '/sink: / {print $2}'`
# make sink id unique
sinks=$(echo "${sink_idx[@]}" | sort -u)

if [ -z "$sinks" ]; then
  # if nobody is playing, manipulate master volume
  amixer set 'Master' $step$plus_minus unmute
else
  # if multiple sinks are playing, manipulate them all
  for sink in $sinks; do
    pactl set-sink-volume $sink $plus_minus$step
  done
fi
