#!/bin/bash
#WU,Qihang <wu.qihang@hotmail.com>#
#Last modified: 02 Mar 2020 10:46:14 AM#
#Run this script to initialize the all the dotfiles

# -------------------------------------------------------
# Parameters
# -------------------------------------------------------
# directory to back up to
backupdir=$HOME/.dotfiles.old.`date '+%Y%m%d%H%M%S'`

# file and folder to be installed
dotfiles=(bash_aliases bashrc \
  conkyrc \
  env \
  gtkrc-2.0.mine\
  gitconfig \
  Xresources Xsession\
  tmux.conf tmux.conf.local tmux.colors \
  vimrc \
  vscode-settings.json \
  vrapperrc \
  wallpaper \
  xinitrc xinputrc xprofile\
  zshrc)
  dotdirs_link=(aria2 \
    bin \
    wallpaper \
    xcolors\
    config/alacritty \
    config/autorandr \
    config/bashconf \
    config/bat \
    config/bin \
    config/dunst \
    config/htop \
    config/i3 \
    config/mpd \
    config/neofetch \
    config/ncmpcpp \
    config/nvim\
    config/picom \
    config/polybar \
    config/powerline \
    config/qutebrowser\
    config/ranger \
    config/termite \
    config/vim \
    config/zathura)

  dotdirs_copy=(fonts vim)


# -------------------------------------------------------
# Notifications
# -------------------------------------------------------
blue='\e[1;34m'
red='\e[1;31m'
white='\e[0;37m'

color_print() {
  printf '\033[0;31m%s\033[0m\n' "$1"
}
warn() {
  color_print "$1" >&2
}
info() {
  printf "\r[ \033[00;34m..\033[0m ] $1\n"
}
user() {
  printf "\r[ \033[0;33m??\033[0m ] $1"
}
success() {
  printf "\r\033[2K[ \033[00;32mOK\033[0m ] $1\n"
}
fail() {
  printf "\r\033[2K[\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

# -------------------------------------------------------
# Installing dotfiles
# -------------------------------------------------------
link_file() {
  local dst=$HOME/.$1 #destination
  local src=$dotroot/$1

    # if the file exist, move it backup dir
    if [ -h $dst ]; then
      rm -f $dst
    elif [ -f $dst ]; then
      mkdir -p $backupdir/
      mv -i $dst $backupdir/
    fi

    # create symbolic link
    ln -sf $src $dst
    if [ $? == 0 ]; then
      success "Linked file $src --> $dst"
    else
      warn "File $src is not successfully linked"
    fi
  }


link_folder() {
  local dst=$HOME/.$1
  local src=$dotroot/$1

    # backup folder
    if [ -h $dst ]; then
      rm -f $dst
    elif [ -d $dst ]; then
      mkdir -p $backupdir/$1
      mv -i $dst $backupdir
    fi

    # create symbolic link
    ln -s $src $dst
    if [ $? == 0 ]; then
      success "Linked folder $src --> $dst"
    else
      warn "Folder $src is not successfully linked"
    fi
  }

copy_folder() {
  local dst=$HOME/.$1
  local src=$dotroot/$1

    # copy stuff
    mkdir -p $dst
    cp -rf $src/. $dst/
    if [ $? == 0 ]; then
      success "Copied folder $src --> $dst"
    else
      warn "Folder $src is not successfully copied"
    fi
  }

install_dot() {
  # backup existing files
  if [ -h $dotroot ]; then
    rm $dotroot
  elif [ -d $dotroot ]; then
    mv -i $dotroot $backupdir
    if [ $? -eq 0 ]; then
      success "Existing dotfiles are backed up at $backupdir"
    else
      warn "Existing dotfiles failed to back up"
    fi
  fi

  user "Do you want to [c]reate a local repo under HOME or [l]ink this current folder directly? "
  read copymethod
  case "$copymethod" in
    c)
      # create folder under HOME and init git
      dotroot=$HOME/.dotfiles
      mkdir -p $dotroot
      git clone ./ $dotroot/ 1>/dev/null 2>&1
      success "Created dotfile repo at $dotroot"
      ;;
    l)
      # directly symlink to this folder
      dotroot=`pwd`
      ;;
    *)
      fail "Unknown option $copymethod."
      exit 1
  esac

    # create symbolic links for files
    for file in ${dotfiles[@]}; do
      link_file $file
    done

    # create symbolic links for folders
    for folder in ${dotdirs_link[@]}; do
      link_folder $folder
    done

    # create symbolic links for folders
    for folder in ${dotdirs_copy[@]}; do
      copy_folder $folder
    done

    # caching fonts
    info "Caching fonts"
    fc-cache -fv >/dev/null 2>&1

    success "Dotfiles installation completed"
  }

# =======================================================
# Main
# -------------------------------------------------------
install_dot
