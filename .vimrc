" basic
set nobackup
set noswapfile
set nu
set ai 
set si
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set wildmenu
set cursorline
set clipboard=unnamedplus
set relativenumber

colorscheme retrobox
set background=dark
syntax enable 
filetype plugin indent on


" vim-plug 
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim',{'branch': 'release'}  
Plug 'vim-syntastic/syntastic'
Plug 'cespare/vim-toml'
Plug 'junegunn/fzf' ,  {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'

call plug#end()


" keybinding
inoremap jk <ESC>
vnoremap jk <ESC>

inoremap ' ''<Left>
inoremap " ""<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap < <><Left>


nnoremap <silent> <Space>sv :vsplit<CR>
nnoremap <silent> <Space>sh :split<CR>
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l

nnoremap <silent> <Space>sc :close<CR>
nnoremap <silent> <Space>so :only<CR>

nnoremap <silent> <Space>e :NERDTreeToggle<CR>

nnoremap <silent> <Space>ff :Files<CR>

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm(): "\<TAB>"
nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> gd :call CocAction('jumpDefinition')<CR>
nnoremap <silent> gr :call CocAction('jumpReferences')<CR>
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" automatic command
autocmd filetype rust nnoremap <Space>sr : <bar>exec 'RustRun'<CR>


" plugin config 
let NERDTreeShowHidden = 1 
let NERDTreeQuitOnOpen = 1 
let NERDTreeMinimalUI = 1 
let NERDTreeDirArrows = 1 

let g:rustfmt_autosave=1
let g:syntastic_rust_checkers = ['cargo']


" lsp server 
" rust : coc-rust-analyzer
" python : coc-pyright
" C++/C : coc-clangd
" shell : coc-sh   
" md : coc-markdownlint
" html : coc-html
" ts/js : coc-tsserver
" css : coc-css
