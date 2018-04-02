#!/bin/sh
set -e

ln -sf $(PWD)/vimrc ~/.vimrc # setup symlink for .vimrc

if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# install homebrew if we're on os x
if [[ 'uname -s' == 'Darwin' ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ -x "$(command -v brew)" ]]; then
	brew install tmux
else
	echo "Did not find any comnpatible package manager"
fi
