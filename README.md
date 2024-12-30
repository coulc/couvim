# 介绍
<h2>适用于rust,go,python的开发</h2>
<div>使用之前确保你安装了rust和go的开发环境</div>


# 依赖环境

以下是该项目所需的依赖环境：

- **fzf**：命令行模糊查找工具
- **python3.12-venv**：用于创建和管理 Python 虚拟环境（Python 3.12 版本）
- **git**：分布式版本控制工具
- **gcc**：GNU 编译器套件
- **npm**：Node.js 的包管理工具
- **wget**：用于从网络上下载文件的命令行工具
- **curl**：命令行工具和库，用于传输数据
- **vim**：高效的文本编辑器
- **ripgrep**：快速搜索工具
- **xclip**：X11 中用于剪切板操作的工具




<div>sudo apt install fzf python3.12-venv git gcc npm wget curl vim</div>
<div>sudo apt-get install ripgrep xclip</div>

# 字体要求 Nerd Font
<div>wget https://github.com/ryanoasis/nerd-font/releases/download/v2.3.3/FantasqueSansMono.zip</div>
<div>mkdir FantasqueSansMono</div>
<div>unzip FantasqueSansMono.zip FantasqueSansMono</div>
<div>sudo mv FantasqueSansMono /usr/share/fonts/FantasqueSansMono/<div>
<div>sudo fc-cache -fv</div>

# lazygit 
访问GitHub： https://github.com/jesseduffield/lazygit


# 注意
<div>这里的rust使用rustaceanvim,所以不需要从mason上下载rust-analyzer，需要手动下载rust-analyzer,codelldb使用mason下载就好了</div>
<div>rustup component add rust-analyzer</div>

