#!/bin/sh

TMP=$(pwd)
GIT_DIR=${TMP%/*}

dpkg-query -f '${binary:Package}\n' -W > ${GIT_DIR}/packages/packages_list.txt

ZSHRC=${HOME}/.zshrc
if [ -f "$ZSHRC" ]; then
	echo "Copying .zshrc"
	cp $ZSHRC ${GIT_DIR}/zsh/.zshrc
fi

ZPROF=${HOME}/.zprofile
if [ -f "$ZPROF" ]; then
	echo "Copying .zprofile"
	cp $ZPROF ${GIT_DIR}/zsh/.zprofile
fi

NVIM=${HOME}/.config/nvim/
if [ -d "$NVIM" ]; then
    echo "Copying nvim config"
    cp -r -p $NVIM ${GIT_DIR}/
fi 

SWAY=${HOME}/.config/sway/
if [ -d "$SWAY" ]; then
    echo "Copying sway config"
    cp -r -p $SWAY ${GIT_DIR}/
fi

FOOT=${HOME}/.config/foot/
if [ -d "$FOOT" ]; then
    echo "Copying foot config"
    cp -r -p $FOOT ${GIT_DIR}/
fi

WAYBAR=${HOME}/.config/waybar/
if [ -d "$WAYBAR" ]; then
    echo "Copying waybar config"
    cp -r -p $WAYBAR ${GIT_DIR}/
fi

WOFI=${HOME}/.config/wofi/
if [ -d "$WOFI" ]; then
    echo "Copying wofi config"
    cp -r -p $WOFI ${GIT_DIR}/
fi

