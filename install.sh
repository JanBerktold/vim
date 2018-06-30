#!/bin/sh
set -e

ln -sf $(PWD)/vimrc ~/.vimrc # setup symlink for .vimrc

if [ ! -d ~/.vim/bundle/Vundle.vim ] ; then
	cwd=$(pwd)
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	cd ~/.vim/bundle/Vundle.vim
	git submodule update --init --recursive
	cd $cwd
fi

brew_install_if_not_exists() {
	brew list $1 || brew install $1
}

# install homebrew if we're on os x
if [[ 'uname -s' == 'Darwin' ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ -x "$(command -v brew)" ]]; then
	brew install mas 	# interface to app store
	mas install 497799835 	# XCode
				# TODO: XCode has to be launched before installing macvim to install additional components.
	mas install 1295203466	# Microsoft Remote Desktop 10.1.8
	brew_install_if_not_exists "tmux"
	brew_install_if_not_exists "cmake"
	brew_install_if_not_exists "go"
	brew_install_if_not_exists "python"
	brew_install_if_not_exists "redis"
	brew_install_if_not_exists "awscli"
	brew_install_if_not_exists "macvim"
	echo "Don't forget to setup the ~/.aws/credentials file"

	brew install caskroom/cask/brew-cask
	brew tap caskroom/versions
	brew cask install sublime-text
	brew cask install intellij-idea
	brew cask install iterm2

	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	ln -sf $(PWD)/.zshrc ~/.zshrc # setup symlink for .zshrc

else
	echo "Did not find any comnpatible package manager"
fi

go get github.com/fatih/hclfmt # required by vim-hclfmt

vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive

~/.vim/bundle/YouCompleteMe/install.py --java-completer --go-completer

# setup Go for YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/gocode
go build
