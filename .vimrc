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

let g:dracula_italic = 0

" PLUG-INS https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

" BUFFERS
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set hidden
set splitbelow
set splitright

nmap <leader>bn :enew<cr>
nmap <leader>bl :ls<cr>
nmap <leader>bs :sbn<cr>
nmap <leader>bv :vnew<cr>
nmap <leader>bl :bnext<cr>
nmap <leader>bh :bprevious<cr>
nmap <leader>bq :bp <bar> bd #<cr>

nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
