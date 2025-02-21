#!/bin/bash

if ! lsb_release -a 2>/dev/null | grep -q "Ubuntu"; then
    echo "当前系统不是 Ubuntu。此脚本仅适用于 Ubuntu 系统。"
    exit 1
fi

if [ "$EUID" -ne 0 ]; then 
    echo "请使用sudo来运行这个脚本"
    exit 2
fi 


apt update && apt install  fzf python3.12-venv git gcc npm wget curl unzip && apt-get install ripgrep xclip


wget https://github.com/neovim/neovim/releases/download/v0.10.3/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
mv nvim-linux64 /usr/local/nvim
rm -rf nvim-linux64.tar.gz
ln -sf /usr/local/nvim/bin/nvim /usr/local/bin/nv
mv nvim $HOME/.config/nvim


wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.tar.xz
tar -xvf JetBrainsMono.tar.xz -d /usr/share/fonts/
rm -rf /usr/share/fonts/README.md  /usr/share/fonts/OFL.txt
fc-cache -fv
rm -rf JetBrainsMono.tar.xz


# ------------------------------------------------------


curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
echo "Rust 已安装完成!版本:$(rustc --version)"


wget https://dl.google.com/go/go1.23.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz
rm go1.23.4.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc
echo "Go 已安装完成!版本:$(go version)"


sudo apt install python3 python3-pip -y
echo "Python3 已安装完成!版本:$(python3 --version)"


sudo apt install openjdk-17-jdk -y


# ------------------------------------------------------


LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm -rf lazygit lazygit.tar.gz
echo "lazygit 已安装完成!版本:$(lazygit --version)"


rustup component add rust-analyzer
echo "rust-analyzer 已安装完成!版本:$(rust-analyzer --version)"


echo "安装完成!"



