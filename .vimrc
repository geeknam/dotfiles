
"au VimEnter * :IndentGuidesEnable

"set cursorline
let mapleader = " "     " set <Lead> to space
set nu                  " Show line numbers
set t_Co=256
set hidden              " hides buffers instead of closing them 
:colorscheme wombat256mod

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line
set showmatch
" make backspaces more powerfull
set backspace=indent,eol,start


set listchars=tab:>-,trail:~
set list
set listchars+=trail:.
set listchars=tab:>-

set ruler                       " show line and column number
syntax on                       " syntax highlighting
set showcmd                     " show (partial) command in status line

set nofoldenable                " disable folding
set history=1000                " remember more history
set undolevels=1000             " use many levels of undo
set wildignore+=*.pyc           " ignore file extensions
set nobackup
set noswapfile

set title
set nocompatible
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

filetype off
filetype plugin indent on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'kevinw/pyflakes-vim'
Bundle 'django.vim'
Bundle 'klen/python-mode'
Bundle 'vim-less'
Bundle 'Lokaltog/vim-powerline'
