#!/bin/bash
cd $HOME

if type [ ! git 2 > /dev/null 2>&1 ]; then
    if type apt-get 2 > /dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install git
    elif type brew 2 > /dev/null 2>&1;then
        brew update
        brew install git
    fi
fi
    


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
