#!/bin/bash

if ! lsb_release -a 2>/dev/null | grep -q "Ubuntu"; then
    echo "This script is only suitable for Ubuntu"
    exit 1
fi

if [ "$EUID" -ne 0 ]; then 
    echo "run with sudo"
    exit 2
fi 


apt install  fzf python3.12-venv git vim gcc npm wget curl unzip && apt-get install ripgrep xclip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.tar.xz
tar -xvf JetBrainsMono.tar.xz -d /usr/share/fonts/
rm -rf /usr/share/fonts/README.md  /usr/share/fonts/OFL.txt
fc-cache -fv
rm -rf JetBrainsMono.tar.xz

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~/
