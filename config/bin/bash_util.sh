#!/usr/bin/bash
function pkgclean(){
    sudo pacman -Rns $(pacman -Qtdq)
}
