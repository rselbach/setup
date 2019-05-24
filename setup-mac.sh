#!/bin/sh

# install brew if not already there
if [[ ! -f "/usr/local/bin/brew" ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

####################
# install essentials
####################
brew install git
brew install vim


# exuberant ctags with go support
brew install ctags
ln -snf ctags $HOME/.ctags

# install other tools
#
brew install wget
brew install minikube
brew cask install 1password
brew cask install google-chrome
brew cask install spotify
brew cask install iterm2
brew cask install slack
brew cask install vmware-fusion
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

