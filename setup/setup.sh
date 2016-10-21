#!/bin/bash
cd $HOME


mkdir .vim
mkdir .vim/dein
mkdir .vim/ftplugin
git clone 'https://github.com/tukumo/dotfiles'
cd dotfiles
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/dein.toml ~/.vim/dein/dein.toml
ln -s ~/dotfiles/dein_lazy.toml ~/.vim/dein/dein_lazy.toml
ln -s ~/dotfiles/ftplugin/python.vim ~/.vim/ftplugin/python.vim
ln -s ~/dotfiles/.latexmkrc ~/.latexmkrc
