#!/bin/sh

# install brew if not already there
if [[ ! -f "/opt/homebrew/bin/brew" ]]; then
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
#brew install --cask 1password
#brew install --cask google-chrome
brew install --cask iterm2
#brew install --cask slack
#brew install --cask vmware-fusion
brew install --cask docker
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
	SETUP_DIR=$(pwd) do_source "$i"
done

