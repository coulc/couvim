" ----- basic -----
set nobackup
set noswapfile
set nu
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set wildmenu
set relativenumber
set scrolloff=5

"colorscheme sorbet
set background=dark
syntax enable 
filetype plugin indent on

" ----- vim-plug -----
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim',{'branch': 'release', 'do': 'yarn install --frozen-lockfile'}  
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'

call plug#end()

" ----- keybinding -----
inoremap jk <ESC>
vnoremap jk <ESC>

nnoremap <silent> <Space>sv :vsplit<CR>
nnoremap <silent> <Space>sh :split<CR>
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l

nnoremap <silent> <Space>sc :close<CR>
nnoremap <silent> <Space>so :only<CR>

" ----- plugin keybinding -----
" coc
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm(): "\<TAB>"
" nnoremap <silent> K :call CocAction('doHover')<CR>
" nnoremap <silent> gd :call CocAction('jumpDefinition')<CR>
" nnoremap <silent> gr :call CocAction('jumpReferences')<CR>
inoremap <silent><expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
inoremap <silent><expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nnoremap <silent> <Space>e :NERDTreeToggle<CR>

" ----- plugin config -----
" nerdtree
let NERDTreeShowHidden = 1 
let NERDTreeQuitOnOpen = 1 
let NERDTreeMinimalUI = 1 
let NERDTreeDirArrows = 1 

colorscheme onedark
