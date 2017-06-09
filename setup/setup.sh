#!/bin/bash
cd $HOME


mkdir .vim
git clone 'https://github.com/tukumo/dotfiles'
cd dotfiles
ln -s ~/dotfiles/.vimrc ~
ln -s ~/dotfiles/.zshrc ~
ln -s ~/dotfiles/.latexmkrc ~
ln -s ~/dotfiles/dein ~/.vim
ln -s ~/dotfiles/ftplugin ~/.vim