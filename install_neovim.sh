#!/bin/bash

# 检查是否是 Ubuntu 系统
if ! lsb_release -a 2>/dev/null | grep -q "Ubuntu"; then
  echo "当前系统不是 Ubuntu。此脚本仅适用于 Ubuntu 系统。"
  exit 1
fi

# 检查权限
if [ "$EUID" -ne 0 ]; then 
  echo "请使用sudo来运行这个脚本"
  exit 2
fi 


# 安装环境
echo "开始安装必要工具..."
# 更新包列表
apt update

# 安装基础工具
echo "安装基础工具包..."
apt install  fzf python3.12-venv git gcc npm wget curl unzip && apt-get install ripgrep xclip


# 提问用户是否需要下载和安装 Neovim
echo "是否需要下载并安装Neovim? (y/n)"
read install_neovim
if [[ "$install_neovim" =~ ^[Yy]$ ]]; then
    # 下载并安装 Neovim
    echo "下载并安装 Neovim..."
    wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
    tar xzvf nvim-linux64.tar.gz
    mv nvim-linux64 /usr/local/nvim
    rm -rf nvim-linux64.tar.gz
    # 提问用户使用什么命令启动 Neovim
    echo "请输入您希望使用的命令来启动 Neovim (例如：nvim 或 nv)："
    read neovim_command
    # 创建符号链接
    ln -sf /usr/local/nvim/bin/nvim /usr/local/bin/$neovim_command
    # 将配置文件移动到用户的系统配置目录
    mv nvim $HOME/.config/nvim
    echo "Neovim 配置已设置完毕，您可以通过 '$neovim_command' 启动 Neovim。"
fi


echo "是否下载GeistMono Nerd Font字体? (y/n) "
read install_font
if [[ "$install_font" =~ ^[Yy]$ ]]; then
    # 下载并安装GeistMono Nerd Font
    echo "下载并安装GeistMono Nerd Font..."
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/GeistMono.zip
    unzip GeistMono.zip -d /usr/share/fonts/
    rm -rf /usr/share/fonts/README.md  /usr/share/fonts/LICENSE
    fc-cache -fv
    rm -rf GeistMono.zip
fi


# ------------------------------------------------------


# 询问用户是否安装 Rust、Go、Python 和 Java 的开发环境
echo "您是否希望安装开发环境(Rust,Go,Python,Java)? (y/n) "
read install_choice

if [[ ! "$install_choice" =~ ^[Yy]$ ]]; then
  echo "取消安装开发环境。退出脚本。"
  exit 3
fi


echo "是否要安装Rust? (y/n) "
read rust_install
if [[ "$rust_install" =~ ^[Yy]$ ]]; then
  curl https://sh.rustup.rs -sSf | sh
  source $HOME/.cargo/env
  echo "Rust 已安装完成!   版本:$(rustc --version)"
fi


echo "是否要安装Go? (y/n)"
read go_install
if [[ "$go_install" =~ ^[Yy]$ ]]; then
  wget https://dl.google.com/go/go1.23.4.linux-amd64.tar.gz
  sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz
  rm go1.23.4.linux-amd64.tar.gz
  echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
  source ~/.bashrc
  echo "Go 已安装完成！"
echo "Go 已安装完成!版本:$(go version)"
fi


echo "是否要安装Python3? (y/n)"
read python_install
if [[ "$python_install" =~ ^[Yy]$ ]]; then
  sudo apt install python3 python3-pip -y
  echo "Python3 已安装完成!版本:$(python3 --version)"
fi


echo "是否要安装openjdk-17-jdk? (y/n)"
read java_install
if [[ "$java_install" =~ ^[Yy]$ ]]; then
  sudo apt install openjdk-17-jdk -y
  echo "Java 已安装完成!版本:$(java -version)"
fi


# ------------------------------------------------------


echo "是否要安装lazygit? (y/n) "
read lazygit_install
if [[ "$lazygit_install" =~ ^[Yy]$ ]]; then
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/
  rm -rf lazygit lazygit.tar.gz
  echo "lazygit 已安装完成!版本:$(lazygit --version)"
fi


echo "是否要安装rust-analyzer? (y/n) "
read rust_analyzer_install
if [[ "$rust_analyzer_install" =~ ^[Yy]$ ]]; then
  rustup component add rust-analyzer
  echo "rust-analyzer 已安装完成!版本:$(rust-analyzer --version)"
fi


echo "安装完成!"



