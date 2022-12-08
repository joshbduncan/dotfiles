syntax on

" set leader key
nnoremap <SPACE> <Nop>
let mapleader=" " 

set nocompatible

" the basics
set autoindent
set backspace=indent,eol,start
set clipboard=unnamed
set cmdheight=2
set colorcolumn=80
set completeopt=menuone,noselect
set conceallevel=0
set cursorline
set encoding=utf-8
set expandtab
set formatoptions-=c
set formatoptions-=o
set formatoptions-=r
set hidden
set hlsearch
set ignorecase
set incsearch
set iskeyword+=-
set laststatus=2
set linebreak
set mouse=a
set nobackup
set noerrorbells
set nomodeline
set noswapfile
set nowrap
set nowritebackup
set number
set numberwidth=4
set relativenumber
set scrolloff=5
set shiftwidth=4
set shortmess+=c
set sidescrolloff=5
set signcolumn=yes
set smartcase
set smartindent
set softtabstop=4
set spelllang=en_us
set splitbelow
set splitright
set tabstop=4
set termguicolors
set timeoutlen=500
set undodir=~/.vim/undodir
set undofile
set updatetime=300
set whichwrap=<,>,[,],h,l
set wildmode=longest,list,full

" plug-ins https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" color scheme
Plug 'dracula/vim', { 'as': 'dracula' }

" nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
" Plug 'vim-scripts/indentpython.vim'
Plug 'Glench/Vim-Jinja2-Syntax'

" i'm getting old
Plug 'liuchengxu/vim-which-key'

" distraction free editing for markdown
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'itspriddle/vim-marked'

" ultisnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" fzf vim integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" easy commenting
Plug 'tpope/vim-commentary'

" git integration
Plug 'tpope/vim-fugitive'

Plug 'itspriddle/vim-marked'

" code search
Plug 'dyng/ctrlsf.vim'

" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'markonm/traces.vim'

" working with registers
" Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers.
Plug 'junegunn/vim-peekaboo'

" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" code formatting
Plug 'psf/black', { 'branch': 'stable' }

call plug#end()

" set color scheme
if ! exists('g:colors_name') || g:colors_name !=# 'dracula'
    colorscheme dracula
endif
let g:dracula_italic=1
let g:lightline = {'colorscheme': 'wombat',}

" keymappings
nnoremap <silent> <leader> :WhichKey '<Space>'<cr>
nnoremap <esc><esc><esc> :nohl<cr>
nnoremap <leader>t :term<cr>
nnoremap <leader>nh :nohlsearch<cr>
nnoremap <leader>mdw :Goyo<cr>
nnoremap <leader>s :setlocal spell!<cr>

" window movements
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" resize splits
nnoremap <C-Up> :resize -2<cr>
nnoremap <C-Down> :resize +2<cr>
nnoremap <C-Left> :vertical resize -2<cr>
nnoremap <C-Right> :vertical resize +2<cr>

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

" working with buffers 
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :q!<cr>
nmap <leader>n :enew<cr>
nmap <leader>d :bdelete<cr>
nmap <leader>D :bdelete!<cr>
nmap <leader>bl :bnext<cr>
nmap <leader>bh :bprevious<cr>

" editing
nnoremap <leader>dt :put=strftime('%Y-%m-%d')<cr>
" markdown task done/undone
nnoremap <leader>mdt o- [ ] 
nnoremap <leader>x :.s/\[ \]/\[x\]<cr>
nnoremap <leader>X :.s/\[x\]/\[ \]<cr>

" copy and pasting
" copy to system clipboard
nnoremap <leader>y "*y
" paste from system clipboard
nnoremap <leader>p "*p
" reselect pasted text
nnoremap gp `[v`]
" yank to end of line
nnoremap Y y$
" prevent x, X, and delete from overriding the clipboard
noremap x "_x
noremap X "_X
noremap <Del> "_x

" keep everything centered 
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" moving text around
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <esc>:m .+1<cr>==gi 
inoremap ˚ <esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv 
vnoremap ˚ :m '<-2<cr>gv=gv

" plug-in settings

" nerdtree settings
nmap <C-\> :NERDTreeToggle<cr>
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1

" enable tagbar
nmap <C-t> :TagbarToggle<cr>

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
let g:syntastic_html_checkers=['']

" coc
source ~/.dotfiles/.coc.vim

" fzf
nmap <C-p> :GFiles<cr>
nmap <leader>gs :GFiles?<cr>
nmap <leader>gc :BCommits<cr>
nmap <leader>ff :Files<cr>
nmap <leader>fb :Buffers<cr>
" PASS OPTIONAL FLAGS TO RG
" ex. :Rg search-term -g '*.md'
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column " . <q-args>, 1, <bang>0)

"ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" ctrlsf
let g:ctrlsf_backend = '/usr/local/bin/rg'
" search across project
nmap <leader>a :CtrlSF -R ""<Left>
" search for word under cursor
nmap <leader>A <Plug>CtrlSFCwordPath -W<cr>

" run black on python save
autocmd BufWritePre *.py execute ':Black'

" setup custom tabs for specific files
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
