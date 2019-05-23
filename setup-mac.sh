#!/bin/sh

# install brew if not already there
if [[ ! -f "/usr/local/bin/brew" ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#############
# set up git
#############
brew install git
git config --global user.name "Roberto Selbach"
git config --global user.email "r@rst.sh"


brew install vim
git clone --recursive git@github.com:robteix/.vim.git ~/.vim
ln -sf $HOME/.vim/vimrc $HOME/.vimrc

############################
# install and set up vscode
############################
brew cask install visual-studio-code
. ./vscode.sh


# exuberant ctags with go support
brew install ctags
ln -snf ctags $HOME/.ctags

# install other tools
#
brew install go
brew install wget
brew install minikube
brew cask install 1password
brew cask install google-chrome
brew cask install spotify
brew cask install iterm2
brew cask install slack
brew cask install vmware-fusion
brew cask install google-cloud-sdk
brew cask install docker
brew install jump
brew install direnv

# go language server
go get -u github.com/saibing/bingo

do_source() {
    local fn="$1"
    [ -f "${fn}" ] || return
    [[ $fn == *-mac || $fn == *-all ]] && source ${fn}
}

# various configs
for i in setup.d/*; do
    do_source "$i"
done

