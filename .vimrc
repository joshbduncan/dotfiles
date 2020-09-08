" SETUP
syntax enable

set noerrorbells

set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set nowrap
set ignorecase
set smartcase
set backspace=indent,eol,start

set colorcolumn=80

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set pastetoggle=<F2>
set mouse=a

" INDENT/UNINDENT WITH TAB/SHIFT-TAB
nmap <Tab> >>
imap <S-Tab> <Esc><<i
nmap <S-tab> <<

let g:dracula_italic = 0

" PLUG-INS https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'

call plug#end()

set encoding=utf-8
colorscheme dracula
set background=dark
let g:airline_theme='dracula'
let g:Powerline_symbols = "fancy"
let g:airline_powerline_fonts = 1

" KEYMAPPINGS
nnoremap <SPACE> <Nop>
let mapleader=" " 
inoremap ,, <Esc>

nmap <leader>s :source %<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q!<cr>

nmap<leader>mo :set mouse=a<cr>
nmap<leader>mx :set mouse=<cr>

" NERDTREE
nmap <leader>\ :NERDTreeToggle<cr>
let g:NERDTreeShowHidden=1

" TAGBAR
nmap <leader>t :TagbarToggle<cr>

" BUFFERS
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set hidden
set splitbelow
set splitright

nmap <leader>bn :enew<cr>
nmap <leader>bb :ls<cr>
nmap <leader>bs :sbn<cr>
nmap <leader>bv :vnew<cr>
nmap <leader>bl :bnext<cr>
nmap <leader>bh :bprevious<cr>
nmap <leader>bq :bp <bar> bd #<cr>

" WINDOW MOVEMENTS
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
