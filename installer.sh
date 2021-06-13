#!/bin/bash

cat bashrc >> ~/.bashrc

cp .tmux.conf ~/
cp .vimrc     ~/

sudo apt-get -y install exuberant-ctags cscope tmux vim

mkdir -p ~/.vim/pack/my-pack/start/
cd ~/.vim/pack/my-pack/start/

git clone https://github.com/fatih/vim-go.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/itchyny/lightline.vim.git

# This will give you the latest version of go
sudo snap install --classic go
