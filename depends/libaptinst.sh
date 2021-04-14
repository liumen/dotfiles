#!/bin/bash
#WU,Qihang <wu.qihang@hotmail.com>#
#Last modified: 01 Jan 2019 11:38:55 AM#

# ===============================================
# FUNCTIONS
# -----------------------------------------------
# Notifications
# ----------------------
color_print() {
    printf '\033[0;31m%s\033[0m\n' "$1"
}
warn() {
    color_print "$1" >&2
}
info() {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}
user() {
    printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}
success() {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}
fail() {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit 1
}

# ----------------------
# Installations
# ----------------------
# commands
instcmd='sudo apt-get install -y'
updcmd='sudo apt-get update'
rmcmd='sudo apt-get purge -y'
upgcmd='sudo apt-get upgrade -y'
autormcmd='sudo apt-get autoremove -y'
addrepo='sudo add-apt-repository -y ppa:'
install_pkgs() {
    # provide an array of package names
    # and install these packages silently
    arr=("$@")
    for pkg in ${arr[@]}
    do
        info "Installing $pkg ..."
        # check if we need to add ppa key
        local ppakey=${pkgppa[$pkg]}
        if [ ! -z $ppakey ]
        then
            info "Adding ppa for $pkg from source $ppakey ..."
            $addrepo$ppakey >/dev/null 2>&1
            if [ $? -eq 0 ]
            then
                $updcmd >/dev/null 2>&1
                success "Key $ppakey for $pkg successfully added"
            else
                warn "Fail to add $ppakey for $pkg as a ppa key!"
            fi
        fi

        # install package
        $instcmd $pkg > /dev/null
        if [ $? -eq 0 ]
        then
            success "$pkg successfully installed"
        else
            warn "Installation for $pkg failed!"
        fi
    done
}

rm_pkgs() {
    arr=("$@")
    for pkg in ${arr[@]}
    do
        which $pkg
        if [ $? -eq 0 ]; then
            info "Removing $pkg..."
            $rmcmd $pkg  > /dev/null
        fi
    done
    
}

# debian fontends throw unnecessary errors
export DEBIAN_FRONTEND="noninteractive"
