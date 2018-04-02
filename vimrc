set nocompatible	" required for vundle
filetype off 		" see above
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
call vundle#end()

syntax enable
set background=dark
colorscheme solarized

filetype plugin indent on

" status line
set laststatus=2
set noshowmode
set noruler
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

