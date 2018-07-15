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
brew cask install visual-studio-code
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

cat >> $HOME/.bash_profile <<EOF
SSH_ENV=\$HOME/.ssh/environment

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > \${SSH_ENV}
     echo succeeded
     chmod 600 \${SSH_ENV}
     . \${SSH_ENV} > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "\${SSH_ENV}" ]; then
     . \${SSH_ENV} > /dev/null
     ps -efp \${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

export GOPATH=\$HOME/go
export PATH=\$PATH:\$GOPATH/bin
EOF
