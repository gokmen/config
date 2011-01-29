#!/bin/bash

cp bashrc ~/.bashrc
source ~/.bashrc
cp vimrc ~/.vimrc
rm -rf ~/.vim
cp -rf vim ~/.vim
cp -rf Xmodmap ~/.Xmodmap
cp -rf tango.colorscheme ~/.kde/share/apps/konsole/
echo "Synced."

