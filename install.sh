#!/bin/sh
set -e

ln -sf $(PWD)/vimrc ~/.vimrc # setup symlink for .vimrc

if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

# install homebrew if we're on os x
if [[ 'uname -s' == 'Darwin' ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ -x "$(command -v brew)" ]]; then
	brew install tmux
	brew install cmake
else
	echo "Did not find any comnpatible package manager"
fi

# install YouCompleteMe
if [[ -x "$(command -v brew)" ]]; then
	cd ~/.vim/bundle
	rm -rf YouCompleteMe/ycmbuild
	mkdir YouCompleteMe/ycmbuild
	cd YouCompleteMe/ycmbuild
	cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
	make ycm_core
fi
