#!/bin/sh

GIT_LOC=/mnt/Files/githubs/dotfiles

cp ${HOME}/.bashrc ${GIT_LOC}/bash/.bashrc
cp ${HOME}/.zshrc ${GIT_LOC}/zsh/.zshrc
cp ${HOME}/.vimrc ${GIT_LOC}/vim/.vimrc
cp ${HOME}/.Xresources ${GIT_LOC}/urxvt/.Xresources
cp ${HOME}/.config/i3/config ${GIT_LOC}/i3/config
cp ${HOME}/.config/i3status/config ${GIT_LOC}/i3status/config
cp -r -p ${HOME}/.emacs.d ${GIT_LOC}/emacs/
cp ${HOME}/.emacs ${GIT_LOC}/emacs/.emacs

if [ -d "/etc/nixos" ]; then 
    cp /etc/nixos/configuration.nix ${GIT_LOC}/nix/base/configuration.nix
    cp /etc/nixos/hardware-configuration.nix ${GIT_LOC}/nix/base/hardware-configuration.nix
fi
