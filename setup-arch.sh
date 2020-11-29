#!/bin/bash

if [ '!' -z "${NO_PACMAN_UPDATE}" ]; then
	sudo pacman -Syu
fi

pacinstall() {
  sudo pacman -S --noconfirmation $@
}

pacinstall vim git wget curl
pacinstall base-devel

# ctags with go support
ln -snf $(pwd)/ctags $HOME/.ctags

do_source() {
	local fn="$1"
	[ -f "${fn}" ] || return
	[[ $fn == *-arch || $fn == *-all ]] && source ${fn}
}

# various configs
for i in setup.d/*; do
	SETUP_DIR=$(pwd) do_source "$i"
done

