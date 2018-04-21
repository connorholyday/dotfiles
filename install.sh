#!/bin/bash

./brew

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

mkdir -p ~/.vim/bundle
mkdir -p ~/.config/nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s "`pwd`"/vimrc ~/.vimrc
ln -s "`pwd`"/vimrc ~/.config/nvim/init.vim
ln -s "`pwd`"/zshrc ~/.zshrc
ln -s "`pwd`"/gitconfig ~/.gitconfig
/usr/local/bin/nvim +PlugInstall +qall
