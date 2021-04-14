#!/bin/bash
# Pull packages from git

dunst(){
    echo "Installing dunst... \n" 
    git clone https://github.com/dunst-project/dunst.git ~/.local/src/dunst
    cd ~/.local/src/dunst
    make
    sudo make install
}

tamzen-font(){
    echo "Installing tamzen-font..."
    git clone https://github.com/sunaku/tamzen-font.git ~/.fonts/tamzen-font
    xset +fp ~/.fonts/tamzen-font/bdf
    xset fp rehash
    echo "Tamzen-font installed."
}


mkdir -p ~/.local/src
tamzen-font

