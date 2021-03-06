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
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-commentary'
Plug 'itspriddle/vim-marked'
Plug 'dyng/ctrlsf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'markonm/traces.vim'
Plug 'junegunn/vim-peekaboo'
call plug#end()

set encoding=utf-8
colorscheme dracula
set background=dark
" let g:airline_theme='dracula'
" let g:Powerline_symbols = "fancy"
" let g:Powerline_symbols = "fancy"
set laststatus=2
let g:lightline = {'colorscheme': 'wombat',}

" KEYMAPPINGS
nnoremap <SPACE> <Nop>
let mapleader=" " 
" inoremap ,, <Esc>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500

nmap <leader>s :source %<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q!<cr>

" YOUCOMPLETEME
" let g:ycm_autoclose_preview_window_after_completion = 1 

" MARK MARKDOWN TASK AS DONE/UNDONE
nmap <leader>t o- [ ] 
nmap <leader>x :.s/\[ \]/\[x\]<cr>
nmap <leader>X :.s/\[x\]/\[ \]<cr>

" COPY/PASTE
vnoremap <C-C> "+y
" map <C-V> "+P

nmap<leader>mo :set mouse=a<cr>
nmap<leader>mx :set mouse=<cr>

" NERDTREE
nmap <C-\> :NERDTreeToggle<cr>
" nmap <leader>\ :NERDTreeToggle<cr>
let g:NERDTreeShowHidden=1

" TAGBAR
nmap <leader>T :TagbarToggle<cr>

" BUFFERS
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
set hidden
set splitbelow
set splitright
nmap <leader>bn :enew<cr>
nmap <leader>bb :ls<cr>
nmap <leader>bs :sbn<cr>
nmap <leader>bv :vnew<cr>
nmap <leader>bl :bnext<cr>
nmap <leader>bh :bprevious<cr>
nmap <leader>bq :bd<cr>

" SYNTASTIC
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
" let g:syntastic_html_checkers=['']

" FZF
nmap <C-f> :GFiles<cr>
nmap <C-s> :Files<cr>
nmap <C-b> :Buffers<cr>


" CtrlSF
let g:ctrlsf_backend = '/usr/local/bin/rg'
nmap <leader>a :CtrlSF -R ""<Left>
nmap <leader>A <Plug>CtrlSFCwordPath -W<cr>


" WINDOW MOVEMENTS
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
