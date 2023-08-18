#!/bin/sh

TMP=$(pwd)
GIT_LOC=${TMP%/*}

dpkg-query -f '${binary:Package}\n' -W > ${GIT_LOC}/packages/packages_list.txt

ZSH=${HOME}/.zshrc
if [ -f "$ZSH" ]; then
	echo "Copying .zshrc"
	cp $ZSH ${GIT_LOC}/zsh/.zshrc
fi

VIM=${HOME}/.vimrc
if [ -f "$VIM" ]; then
	echo "Copying .vimrc"
	cp $VIM ${GIT_LOC}/vim/.vimrc
fi

XRES=${HOME}/.Xresources
if [ -f "$XRES" ]; then
	echo "Copying .Xresources"
	cp $XRES ${GIT_LOC}/urxvt/.Xresources
fi

I3=${HOME}/.config/i3/config
if [ -f "$I3" ]; then
	echo "Copying i3 config"
	cp $I3 ${GIT_LOC}/i3laptop/i3/config
fi

I3STAT=${HOME}/.config/i3status/config
if [ -f "$I3STAT" ]; then
	echo "Copying i3status config"
	cp $I3STAT ${GIT_LOC}/i3laptop/i3status/config
fi

AWM=${HOME}/.config/awesome/
if [ -d "$AWM" ]; then
	echo "Copying .config/awesome/"
	cp -r -p $AWM ${GIT_LOC}/
fi

EMACSD=${HOME}/.emacs.d
if [ -d "$EMACSD" ]; then
	echo "Copying .emacs.d"
	cp -r -p $EMACSD ${GIT_LOC}/
fi

EMACS=${HOME}/.emacs
if [ -f "$EMACS" ]; then
	echo "Copying .emacs"
	cp $EMACS ${GIT_LOC}/emacs/.emacs
fi

NVIM=${HOME}/.config/nvim/
if [ -d "$NVIM" ]; then
    echo "Copying nvim config"
    cp -r -p $NVIM ${GIT_LOC}/
fi 

TILIX=${HOME}/.config/tilix/
if [ -d "$TILIX" ]; then
    echo "Copying tilix config"
    cp -r -p $TILIX ${GIT_LOC}/
fi

SWAY=${HOME}/.config/sway/
if [ -d "$SWAY" ]; then
    echo "Copying sway config"
    cp -r -p $SWAY ${GIT_LOC}/
fi

FOOT=${HOME}/.config/foot/
if [ -d "$FOOT" ]; then
    echo "Copying foot config"
    cp -r -p $FOOT ${GIT_LOC}/
fi

WAYBAR=${HOME}/.config/waybar/
if [ -d "$WAYBAR" ]; then
    echo "Copying waybar config"
    cp -r -p $WAYBAR ${GIT_LOC}/
fi

if [ -d "/etc/nixos" ]; then 
	echo "Coyping nixos files"
	cp /etc/nixos/configuration.nix ${GIT_LOC}/nix/base/configuration.nix
	cp /etc/nixos/hardware-configuration.nix ${GIT_LOC}/nix/base/hardware-configuration.nix
fi
