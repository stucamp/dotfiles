#!/bin/sh

TMP=$(pwd)
GIT_LOC=${TMP%/*}

dpkg-query -f '${binary:Package}\n' -W > ${GIT_LOC}/packages/packages_list.txt

ZSH=${HOME}/.zshrc
if [ -f "$ZSH" ]; then
	echo "Copying .zshrc"
	cp $ZSH ${GIT_LOC}/zsh/.zshrc
fi

NVIM=${HOME}/.config/nvim/
if [ -d "$NVIM" ]; then
    echo "Copying nvim config"
    cp -r -p $NVIM ${GIT_LOC}/
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

WOFI=${HOME}/.config/wofi/
if [ -d "$WOFI" ]; then
    echo "Copying wofi config"
    cp -r -p $WOFI ${GIT_LOC}/
fi

