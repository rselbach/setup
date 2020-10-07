#!/bin/bash

if [ '!' -z "${NO_APT_UPDATE}" ]; then
	sudo apt-get update
fi

aptinstall() {
  sudo apt install --no-install-recommends -y $@
}

aptinstall vim git wget curl
aptinstall build-essential

# direnv
aptinstall direnv

# can't live without jump
JUMPVER=0.22.0
wget https://github.com/gsamokovarov/jump/releases/download/v${JUMPVER}/jump_${JUMPVER}_amd64.deb
sudo dpkg -i jump_${JUMPVER}_amd64.deb

# ctags with go support
ln -snf $(pwd)/ctags $HOME/.ctags

do_source() {
	local fn="$1"
	[ -f "${fn}" ] || return
	[[ $fn == *-debian || $fn == *-all ]] && source ${fn}
}

# various configs
for i in setup.d/*; do
	SETUP_DIR=$(pwd) do_source "$i"
done

