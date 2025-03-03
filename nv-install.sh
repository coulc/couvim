#!/bin/bash

if ! lsb_release -a 2>/dev/null | grep -q "Ubuntu"; then
    echo "This script is only suitable for Ubuntu"
    exit 1
fi

if [ "$EUID" -ne 0 ]; then 
    echo "run with sudo"
    exit 2
fi 


apt update && apt install  fzf python3.12-venv git gcc npm wget curl unzip && apt-get install ripgrep xclip

# neovim
wget https://github.com/neovim/neovim/releases/download/v0.10.3/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
cp -r nvim-linux64 /usr/local/nvim
rm -rf nvim-linux64.tar.gz
ln -sf /usr/local/nvim/bin/nvim /usr/local/bin/nv
mv nvim $HOME/.config/nvim

# nerdfont 
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.tar.xz
tar -xvf JetBrainsMono.tar.xz -d /usr/share/fonts/
rm -rf /usr/share/fonts/README.md  /usr/share/fonts/OFL.txt
fc-cache -fv
rm -rf JetBrainsMono.tar.xz

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm -rf lazygit lazygit.tar.gz
echo "$(lazygit --version)"

# rust-analyzer
rustup component add rust-analyzer
echo "$(rust-analyzer --version)"


echo "ok!"



