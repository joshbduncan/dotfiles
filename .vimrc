" enable mouse
set mouse=a

" basic syntax highlighting
syntax enable

" no beeping
set noerrorbells

" line numbering
set number relativenumber

" set file encoding
set encoding=utf-8

" proper tabs
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" indenting
set autoindent smartindent

" don't wrap long lines
set nowrap

" searching
set ignorecase smartcase incsearch

" enable proper backspace support
set backspace=indent,eol,start

" keep line in check
set colorcolumn=80

" file handling
set autochdir noswapfile nobackup

" put splits in the right spots
set splitbelow splitright

" window movements
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" working with buffers
set hidden
nmap <leader>bn :enew<cr>
nmap <leader>bv :vnew<cr>
nmap <leader>bl :bnext<cr>
nmap <leader>bh :bprevious<cr>

" command mode completion
set wildmode=longest,list,full

" undo
set undodir=~/.vim/undodir undofile

" enable pasting from system clipboard
set pastetoggle=<F2>

" indent/unindent with tab/shift-tab
nmap <Tab> >>
imap <S-Tab> <Esc><<i
nmap <S-tab> <<

" plug-ins https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/indentpython.vim'
Plug 'lepture/vim-jinja'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'itspriddle/vim-marked'
Plug 'dyng/ctrlsf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'markonm/traces.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'Valloric/YouCompleteMe'
Plug 'psf/black', { 'branch': 'stable' }

call plug#end()

" set color scheme
set background=dark
colorscheme dracula
let g:dracula_italic = 0
let g:lightline = {'colorscheme': 'wombat',}
set laststatus=2

" keymappings
nnoremap <SPACE> <Nop>
let mapleader=" " 
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500

" source .vimrc, write buffer, quit buffer
nmap <leader>s :so %<cr>
nmap <leader>w :w<cr>
nmap <leader>q :q!<cr>

" markdown task done/undone
nmap <leader>t o- [ ] 
nmap <leader>x :.s/\[ \]/\[x\]<cr>
nmap <leader>X :.s/\[x\]/\[ \]<cr>

" copy to system clipboard
" vnoremap <C-C> "+y
" paste from system clipboard
" map <C-V> "+P
" reselect pasted text
nnoremap gp `[v`]
" yank to end of line
nnoremap Y y$


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
" let g:syntastic_html_checkers=['']

" fzf
nmap <C-f> :GFiles<cr>
nmap <C-p> :Files<cr>
nmap <C-b> :Buffers<cr>
" PASS OPTIONAL FLAGS TO RG
" ex. :Rg search-term -g '*.md'
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column " . <q-args>, 1, <bang>0)

" ctrlsf
let g:ctrlsf_backend = '/usr/local/bin/rg'
" search across project
nmap <leader>a :CtrlSF -R ""<Left>
" search for word under cursor
nmap <leader>A <Plug>CtrlSFCwordPath -W<cr>

" run black on python save
autocmd BufWritePre *.py execute ':Black'
