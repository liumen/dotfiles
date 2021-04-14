#!/bin/bash
#WU,Qihang <wu.qihang@hotmail.com>#
#Last modified: 02 Jan 2019 02:47:22 PM#
#This script sets up dependencies needed for i3 and polybar
#Tested Ubuntu 16.04
#Run with sudo priviledge

source ./libaptinst.sh

i3wm=(i3 i3blocks compton feh lxappearance rofi xautolock)
dunst=(libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev \
    libxss-dev libglib2.0-dev libpango1.0-dev \
    libgtk2.0-dev libxdg-basedir-dev) # then install dunst from git
ranger=(ranger caca-utils highlight atool w3m poppler-utils mediainfo)
polybar=(libclang clang \
libcurl4-openssl-dev \
libasound2-dev \
mpd libmpdclient-dev \
libcairo2-dev \
python-xcbgen \
libasound2-dev \
libxcb*-dev xcb-proto \
arandr \
libiw-dev \
x11-utils)

theme=(arc-theme paper-icon-theme)

# packages that require ppa key
declare -A pkgppa
pkgppa=( \
    ["rofi"]="jasonpleau/rofi" \
    ["paper-icon-theme"]="snwh/ppa" \
    ["arc-theme"]="noobslab/themes"
)


#MAIN
if [ $(whoami) != 'root' ]
then
    fail "Must be run as root $0"
    exit 1;
fi

install_pkgs "${i3wm[@]}"
install_pkgs "${dunst[@]}"
install_pkgs "${ranger[@]}"
install_pkgs "${theme[@]}"

# set dconf value so that nautilus does not show desktop
gsettings set org.gnome.desktop.background show-desktop-icons false
