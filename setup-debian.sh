#!/bin/sh

if [ '!' -z "${NO_APT_UPDATE}" ]; then
	sudo apt-get update
fi

aptinstall() {
  sudo apt install --no-install-recommends -y $@
}

aptinstall vim git wget curl
aptinstall build-essential

# spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
aptistall spotify-client

# restore my vim settings
git clone --recursive git@github.com:robteix/.vim.git ~/.vim

git config --global user.name "Roberto Selbach"
git config --global user.email "r@rst.sh"


aptinstall libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
sudo apt-get -f install


# Google Cloud SDK

export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && aptinstall google-cloud-sdk google-cloud-sdk-app-engine-go


# install vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update && aptinstall -y code

. ./vscode.sh


# direnv
sudo apt-get install direnv

# can't live without jump
JUMPVER=0.22.0
wget https://github.com/gsamokovarov/jump/releases/download/v${JUMPVER}/jump_${JUMPVER}_amd64.deb
sudo dpkg -i jump_${JUMPVER}_amd64.deb



# config zsh
cp -f zshrc $HOME/.zshrc
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

# ctags with go support
ln -snf ctags $HOME/.ctags

# fix keyboard
sed -e 's,\xc4\x86,\xc3\x87,g' \
    -e 's,\xc4\x87,\xc3\xa7,g' \
    < /usr/share/X11/locale/en_US.UTF-8/Compose > $HOME/.XCompose

cat >> /etc/environment <<EOF
GTK_IM_MODULES=cedilla
QT_IM_MODULES=cedilla
EOF


# various configs
for i in setup.d/*-all; do
	source "$i"
done
