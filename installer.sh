#!/bin/bash

if [ "$EUID" -eq 0 ]
  then echo "Can't run as root"
  exit
fi

cp .vimrc ~/.vimrc

sudo apt-get -y install ctags cscope tmux

mkdir -p ~/.vim/pack/my-pack/start/
cd ~/.vim/pack/my-pack/start/

git clone https://github.com/fatih/vim-go.git
git clone https://github.com/majutsushi/tagbar.git
