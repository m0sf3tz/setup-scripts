#!/bin/bash

if [ "$EUID" -eq 0 ]
  then echo "Can't run as root"
  exit
fi

cp .vimrc ~/.vimrc

sudo apt-get -y install ctags cscope tmux

git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
