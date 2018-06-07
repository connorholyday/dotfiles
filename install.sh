#!/bin/bash

./brew

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/undo
mkdir -p ~/.config/nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s "`pwd`"/vimrc ~/.vimrc
ln -s "`pwd`"/vimrc ~/.config/nvim/init.vim
ln -s "`pwd`"/vim/UltiSnips ~/.vim/UltiSnips
ln -s "`pwd`"/zshrc ~/.zshrc
ln -s "`pwd`"/gitconfig ~/.gitconfig
ln -s "`pwd`"/gitignore ~/.gitignore
ln -s "`pwd`"/hyper.js ~/.hyper.js
ln -s "`pwd`"/chunkwmrc ~/.chunkwmrc
ln -s "`pwd`"/skhdrc ~/.skhdrc
ln -s "`pwd`"/ripgreprc ~/.ripgreprc
ln -s "`pwd`"/ctags ~/.ctags

chmod +x ~/.chunkwmrc

/usr/local/bin/nvim +PlugInstall +qall

go get golang.org/x/tools/cmd/godoc
go get github.com/golang/lint/golint
go get golang.org/x/tour/gotour

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# oh my zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

