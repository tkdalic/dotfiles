#!/bin/bash
cd $HOME


mkdir .vim
git clone 'https://github.com/tukumo/dotfiles'
cd dotfiles
ln -s ~/dotfiles/.zshrc ~

if [[ $(command -v brew) == "" ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install git gh anyenv vim
