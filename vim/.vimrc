"Vundle Stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on


"Colors
syntax on

"Spacing and Tabs
set tabstop=4
set softtabstop=4
set expandtab

"UI Config
set number
set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch

"Searching
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

"Movement

"Leader Shortcuts

"Launch Config
