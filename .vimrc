set nocompatible		" be iMproved, required
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'

Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'Raimondi/delimitMate'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line'

" Customization

" Keymappings
    :let mapleader = ","

    " i hate escape key
       inoremap \\ <Esc>

    " ,s to save
        nmap <leader>s :w<cr>
    " ,q to quit
        nmap <leader>q :q!<cr>

    " tab stuff
        "nmap <leader>tn :tabnew<cr>
        "nmap <leader>tt :tabnext<cr>
        " nmap <leader>tk :tabnext<cr>
        " nmap <leader>tj :tabprev<cr>
        " nmap <leader>th :tabfirst<cr>
        " nmap <leader>tl :tablast<cr>

    " Buffer Fun
        " Enable the list of buffers
            let g:airline#extensions#tabline#enabled = 1

        " Show just the filename
            let g:airline#extensions#tabline#fnamemod = ':t'

        " This allows buffers to be hidden if you've modified a buffer.
        " This is almost a must if you wish to use buffers in this way.
            set hidden
            set splitbelow
            set splitright

            nmap <leader>b :enew<cr>
            nmap <leader>s :sbn<cr>
            nmap <leader>v :vnew<cr>
            nmap <leader>l :bnext<cr>
            nmap <leader>h :bprevious<cr>

        " Close the current buffer and move to the previous one
        " This replicates the idea of closing a tab
            nmap <leader>bq :bp <BAR> bd #<CR>

        " Show all open buffers and their status
            nmap <leader>bl :ls<CR>

        " Setup split key combos
            nnoremap <C-J> <C-W>j
            nnoremap <C-K> <C-W>k
            nnoremap <C-L> <C-W>l
            nnoremap <C-H> <C-W>h

let g:Powerline_symbols = "fancy"
let g:Powerline_dividers_override = ["\Ue0b0","\Ue0b1","\Ue0b2","\Ue0b3"]
let g:Powerline_symbols_override = {'BRANCH': "\Ue0a0", 'LINE': "\Ue0a1", 'RO': "\Ue0a2"}
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"Airline Themes
let g:airline_theme='dracula'

" pasting from external apps
set pastetoggle=<F2>

" searching
set ignorecase
set smartcase

" line numbers
set relativenumber
set number

set mouse=a
set backspace=indent,eol,start
set t_Co=256			"set colors to 256
syntax enable			"use syntax highlighting
set encoding=utf-8

" setup for ycm
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
let g:ycm_complete_in_comments = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {'python' : ['re!\w{2}']}

" setup for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

" autoformat
augroup autoformat_settings
    autocmd FileType python AutoFormatBuffer yapf
augroup END

" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <silent> <F7> : NERDTreeToggle<CR>

" setup for ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
        \ }
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip
        let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" setup for indent line
let g:indentLine_char = '│'
set tags=./tags,tags;$HOME
"source ~/cscope_maps.vim

" indent for global
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

" PEP8 Python Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ | set softtabstop=4
    \ | set shiftwidth=4
    \ | set textwidth=79
    \ | set expandtab
    \ | set autoindent
    \ | set fileformat=unix

" center after jump
    nmap gg ggzz
    nmap G Gzz
    nmap n nzz
    nmap N Nzz

:command EDITVIM tabnew<Space>$MYVIMRC
:command RELOADVIM so<Space>%<cr>
