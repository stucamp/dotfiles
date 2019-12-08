"Vundle Stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

set path+=**

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
nnoremap <CR> :noh<CR><CR>

"Movement
command! MakeTags !ctags -R .

let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


"Leader Shortcuts

"Launch Config
