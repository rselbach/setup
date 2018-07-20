#!/bin/sh

# install brew if not already there
if [[ ! -f "/usr/local/bin/brew" ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install git
brew install vim
brew install go
brew install wget
brew install minikube

brew cask install 1password
brew cask install google-chrome
brew cask install spotify
brew cask install iterm2
brew cask install rambox
brew cask install slack
brew cask install vmware-fusion
brew cask install google-cloud-sdk
brew cask install docker

# restore my vim settings
git clone --recursive git@github.com:rselbach/.vim.git ~/.vim
ln -sf $HOME/.vim/vimrc $HOME/.vimrc

# setup git
git config --global user.name "Roberto Selbach"
git config --global user.email "r@rst.sh"


# install and set up vscode

brew cask install visual-studio-code
. ./vscode.sh


# add stuff to bash_profile
cat bashrc >> $HOME/.bash_profile
