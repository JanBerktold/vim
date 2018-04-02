set nocompatible	" required for vundle
filetype off 		" see above
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()

syntax enable
set background=dark
colorscheme solarized

filetype plugin indent on

