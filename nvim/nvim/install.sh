#!/bin/sh

wget 

tar xzvf nvim-linux64.tar.gz -C /opt/

mkdir .config/nvim

sudo apt install git python3-pip python3-virtualenv python3-wheel 

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/github/copilot.vim.git \
  ~/.config/nvim/pack/github/start/copilot.vim

