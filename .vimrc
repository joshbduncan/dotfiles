syntax on

" set leader key
nnoremap <SPACE> <Nop>
let mapleader=" " 


" the basics
set autochdir noswapfile nobackup
set autoindent smartindent
set backspace=indent,eol,start
set cmdheight=2
set clipboard=unnamed
set colorcolumn=80
set completeopt=menuone,noselect
set conceallevel=0
set cursorline
set encoding=utf-8
" stop auto commenting
set formatoptions-=r formatoptions-=c formatoptions-=o
set hidden
set ignorecase smartcase incsearch hlsearch
set laststatus=2
set mouse=a
set nobackup nowritebackup
set noerrorbells
set nomodeline
set nowrap
set number relativenumber
set pumheight=10
set scrolloff=5 sidescrolloff=5
set shortmess+=c
set signcolumn=yes
set spelllang=en_us
set splitbelow splitright
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set termguicolors
set timeoutlen=500
set undodir=~/.vim/undodir undofile
set updatetime=300
set whichwrap=<,>,[,],h,l
" command mode completion
set wildmode=longest,list,full

" plug-ins https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" color scheme
Plug 'dracula/vim', { 'as': 'dracula' }

" Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'itchyny/lightline.vim'
" Plug 'majutsushi/tagbar'
" Plug 'scrooloose/syntastic'
" Plug 'vim-scripts/indentpython.vim'
" Plug 'lepture/vim-jinja'

" i'm getting old
Plug 'liuchengxu/vim-which-key'

" distraction free editing for markdown
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'

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

" Plug 'itspriddle/vim-marked'
" Plug 'dyng/ctrlsf.vim'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'markonm/traces.vim'
" Plug 'junegunn/vim-peekaboo'

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
nnoremap <leader>t :term<cr>
nnoremap <leader>nh :nohlsearch<cr>
nnoremap <leader>md :Goyo<cr>
nnoremap <leader>s :setlocal spell!<cr>

" window movements
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" indent/unindent with tab/shift-tab
nmap <Tab> >>
imap <S-Tab> <Esc><<i
nmap <S-tab> <<

" working with buffers 
nmap <leader>r :source %<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :q!<cr>
nmap <leader>n :enew<cr>
nmap <leader>d :bdelete<cr>
nmap <leader>D :bdelete!<cr>

" moving through buffers
nmap <leader>bv :vnew<cr>
nmap <leader>bl :bnext<cr>
nmap <leader>bh :bprevious<cr>

" editing
nnoremap <leader>dt :put=strftime('%Y-%m-%d')<cr>
" markdown task done/undone
nnoremap <leader>mtd o- [ ] 
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
vnoremap <C-j> :m '>+1<cr>gv=gv 
vnoremap <C-k> :m '<-2<cr>gv=gv
inoremap <C-j> <esc>:m .+1<cr>==gi 
inoremap <C-k> <esc>:m .-2<cr>==gi
nnoremap <leader>j :m .+1<cr>==
nnoremap <leader>k :m .-2<cr>==

" plug-in settings

" nerdtree settings
" nmap <C-\> :NERDTreeToggle<cr>
" let g:NERDTreeShowHidden=1
" let g:NERDTreeAutoDeleteBuffer=1

" enable tagbar
" nmap <C-t> :TagbarToggle<cr>

" syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_python_exec = 'python3'
" let g:syntastic_python_checkers = ['python']
" let g:syntastic_html_checkers=['']

" coc
source ~/coc.vim

" fzf
nmap <C-g> :GFiles<cr>
nmap <leader>gs :GFiles?<cr>
nmap <leader>gc :BCommits<cr>
nmap <C-p> :Files<cr>
nmap <C-b> :Buffers<cr>
" PASS OPTIONAL FLAGS TO RG
" ex. :Rg search-term -g '*.md'
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column " . <q-args>, 1, <bang>0)

"ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" ctrlsf
" let g:ctrlsf_backend = '/usr/local/bin/rg'
" search across project
" nmap <leader>a :CtrlSF -R ""<Left>
" search for word under cursor
" nmap <leader>A <Plug>CtrlSFCwordPath -W<cr>

" run black on python save
autocmd BufWritePre *.py execute ':Black'
