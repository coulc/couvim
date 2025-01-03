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

# 下载并安装最新版Neovim
echo "下载并安装Neovim..."
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz 
tar xzvf nvim-linux64.tar.gz
mv nvim-linux64 /usr/local/nvim
rm -rf nvim-linux64.tar.gz 

# 提问用户使用什么命令启动Neovim
echo "请输入您希望使用的命令来启动 Neovim (例如：nvim 或 nv)："
read neovim_command

# 检查是否已存在同名命令
if [ -e "/usr/local/bin/$neovim_command" ]; then
  echo "$neovim_command 已经存在，是否需要覆盖? (y/n)"
  read answer
  if [[ ! "$answer" =~ ^[Yy]$ ]]; then
    echo "Aborting."
    exit 1
  fi
fi

ln -sf /usr/local/nvim/bin/nvim /usr/local/bin/$neovim_command

# 下载并安装GeistMono Nerd Font
echo "下载并安装GeistMono Nerd Font..."
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/GeistMono.zip
unzip GeistMono.zip -d ~/usr/share/fonts/
fc-cache -fv
rm GeistMono.zip
echo "neovim安装完成！"


# 询问用户是否安装 Rust、Go、Python 和 Java 的开发环境
echo "您是否希望安装以下开发环境？ (Rust, Go, Python3, Java)"
echo "这将安装最新版本的 Rust、Go、Python3 和 Java。"
echo "请输入 'y' 安装，或输入 'n' 取消安装并退出。"
read install_choice

if [[ ! "$install_choice" =~ ^[Yy]$ ]]; then
  echo "取消安装开发环境。退出脚本。"
  exit 0
fi

echo "检查并安装最新的开发环境：Rust、Go、Python 和 Java"


# 检查 Rust 是否安装
if ! command -v rustc &>/dev/null; then
  echo "Rust 未安装，是否要安装最新版本的 Rust? (y/n)"
  read rust_install
  if [[ "$rust_install" =~ ^[Yy]$ ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source $HOME/.cargo/env
    echo "Rust 已安装完成！"
  fi
else
  echo "Rust 已安装，版本：$(rustc --version)"
fi

# 检查 Go 是否安装
if ! command -v go &>/dev/null; then
  echo "Go 未安装，是否要安装最新版本的 Go? (y/n)"
  read go_install
  if [[ "$go_install" =~ ^[Yy]$ ]]; then
    wget https://dl.google.com/go/go1.23.4.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz
    rm go1.23.4.linux-amd64.tar.gz
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
    source ~/.bashrc
    echo "Go 已安装完成！"
  fi
else
  echo "Go 已安装，版本：$(go version)"
fi

# 检查 Python 是否安装
if ! command -v python3 &>/dev/null; then
  echo "Python3 未安装，是否要安装最新版本的 Python3? (y/n)"
  read python_install
  if [[ "$python_install" =~ ^[Yy]$ ]]; then
    sudo apt install python3 python3-pip -y
    echo "Python3 已安装完成！"
  fi
else
  echo "Python3 已安装，版本：$(python3 --version)"
fi

# 检查 Java 是否安装
if ! command -v java &>/dev/null; then
  echo "Java 未安装，是否要安装openjdk-17-jdk? (y/n)"
  read java_install
  if [[ "$java_install" =~ ^[Yy]$ ]]; then
    sudo apt install openjdk-17-jdk -y
    echo "Java 已安装完成！"
  fi
else
  echo "Java 已安装，版本：$(java -version)"
fi

echo "开发环境安装完成！"

echo "安装插件依赖环境"
# 检查 lazygit 是否已安装
if ! command -v lazygit &>/dev/null; then
  echo "lazygit 未安装，是否要安装最新版本的 lazygit? (y/n)"
  read lazygit_install
  if [[ "$lazygit_install" =~ ^[Yy]$ ]]; then
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
    echo "lazygit 已安装完成！"
  fi
else
  echo "lazygit 已安装，版本：$(lazygit --version)"
fi

# 检查 rust-analyzer 是否已安装
if ! command -v rust-analyzer &>/dev/null; then
  echo "rust-analyzer 未安装，是否要安装最新版本的 rust-analyzer? (y/n)"
  read rust_analyzer_install
  if [[ "$rust_analyzer_install" =~ ^[Yy]$ ]]; then
    rustup component add rust-analyzer
    echo "rust-analyzer 已安装完成！"
  fi
else
  echo "rust-analyzer 已安装，版本：$(rust-analyzer --version)"
fi

echo "安装完成！请尽情享受 KingNvim 吧！"
