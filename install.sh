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

ln -s ~/Dropbox/dotfiles/bashrc ~/.bashrc 
ln -s ~/Dropbox/dotfiles/bash_profile ~/.bash_profile
ln -s ~/Dropbox/dotfiles/vimrc ~/.vimrc
ln -s ~/Dropbox/dotfiles/gvimrc ~/.gvimrc
ln -s ~/Dropbox/dotfiles/aliases ~/.aliases
ln -s ~/Dropbox/dotfiles/xvimrc ~/.xvimrc
ln -s ~/Dropbox/dotfiles/tcshrc ~/.tcshrc
ln -s ~/Dropbox/dotfiles/zshrc ~/.zshrc
ln -s ~/Dropbox/dotfiles/editrc ~/.editrc
ln -s ~/Dropbox/dotfiles/inputrc ~/.inputrc
