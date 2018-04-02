#!/bin/sh
set -e

ln -sf $(PWD)/vimrc ~/.vimrc # setup symlink for .vimrc

if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

