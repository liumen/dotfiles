#!/bin/bash
#WU,Qihang <wu.qihang@hotmail.com>#
#Last modified: 02 Jan 2019 08:10:42 AM#
# inspired by
# https://github.com/Corwind/termite-install.git 
# script for installing termite

source ./libaptinst.sh

termite_depends=(\
    libgirepository1.0-dev \
    libgnutls-dev \
    git \
    g++ \
    gperf \
    libgtk-3-dev \
    gtk-doc-tools \
    gnutls-bin \
    valac \
    intltool \
    libpcre2-dev \
    libglib3.0-cil-dev \
    libgnutls28-dev \
    libgirepository1.0-dev \
    libxml2-utils \
    gperf)

install_pkgs "${termite_depends[@]}"
success "Termite dependencies successfully installed"
#
mkdir -p TermiteInstall && cd ./TermiteInstall
git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git
#
export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng && ./autogen.sh && make && sudo make install
info "vte-ng installed"

cd ../termite && make && sudo make install
sudo ldconfig
info "termite installed"

info "running post-installation setups"

# some claim this is not necessary
# sudo mkdir -p /lib/terminfo/x
# sudo ln -s /usr/local/share/terminfo/x/xterm-termite \
# /lib/terminfo/x/xterm-termite

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/termite 60

# get terminfo file -- already done in installation process
# wget https://raw.githubusercontent.com/thestinger/termite/master/termite.terminfo
# tic -x termite.terminfo
