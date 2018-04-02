set nocompatible	" required for vundle
filetype off 		" see above
set rtp+=~/.vim/bundle/Vundle.vim

:syntax on

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()

filetype plugin indent on

