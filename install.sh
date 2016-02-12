#!/bin/sh
#
#rm old links and add new ones
rm ~/.bashrc 
rm ~/.bash_profile
rm ~/.vimrc
rm ~/.gvimrc
rm ~/.aliases
rm ~/.xvimrc
rm ~/.tcshrc
rm ~/.zshrc
rm ~/.editrc
rm ~/.inputrc

ln -s ~/nodb/dotfiles/bashrc ~/.bashrc 
ln -s ~/nodb/dotfiles/bash_profile ~/.bash_profile
ln -s ~/nodb/dotfiles/vimrc ~/.vimrc
ln -s ~/nodb/dotfiles/gvimrc ~/.gvimrc
ln -s ~/nodb/dotfiles/aliases ~/.aliases
ln -s ~/nodb/dotfiles/xvimrc ~/.xvimrc
ln -s ~/nodb/dotfiles/tcshrc ~/.tcshrc
ln -s ~/nodb/dotfiles/zshrc ~/.zshrc
ln -s ~/nodb/dotfiles/editrc ~/.editrc
ln -s ~/nodb/dotfiles/inputrc ~/.inputrc
