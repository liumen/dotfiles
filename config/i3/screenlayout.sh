#!/bin/bash
#Monitor setup, put under ~/.screenlayout/
#WU,Qihang <wu.qihang@hotmail.com>#
#Last modified: 02 Jun 2019 01:22:40 PM#
# if [ $(hostname) == qihangworkstation ]
# then
  # xrandr --output DVI-D-0 --primary --mode 2560x1600 --pos 0x0 --rotate normal --output HDMI-0 --mode 1920x1080 --pos 2560x0 --rotate left --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off
  # xrandr --output DVI-D-0 --primary --mode 2560x1600 --pos 0x0 --rotate normal --output HDMI-0 --mode 1920x1080 --pos 2560x0 --rotate normal --output DP-0 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off
# fi

if [ $(hostname) == geodynamiker ] || [ $(hostname) == qihangdesktop ]
then
  xrandr --output HDMI-0 --mode 1920x1080 --pos 2560x0 --rotate normal --output DVI-D-0 --primary --mode 2560x1600 --pos 0x0 --rotate normal --output HDMI-0 --off
fi
