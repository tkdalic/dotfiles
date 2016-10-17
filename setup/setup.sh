#!/bin/bash

cd $HOME
mkdir .vim
mkdir .vim/dein
mkdir .vim/ftplugin
mkdir .vim/colors
git clone 'https://github.com/tukumo/dotfiles'
cd dotfiles
ln -s .vimrc ~/.vimrc
ln -s .zshrc ~/.zshrc
ln -s dein.toml ~/.vim/dein/dein.toml
ln -s dein_lazy.toml ~/.vim/dein/dein_lazy.toml
ln -s ftplugin/python.vim ~/.vim/ftplugin/python.vim
ln -s colors/hybrid ~/.vim/colors/hybrid
