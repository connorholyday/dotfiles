#!/bin/bash

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

./brew

env RCRC=$HOME/dotfiles/rcrc rcup

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/undo
mkdir -p ~/.config/nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s "`pwd`"/vimrc ~/.config/nvim/init.vim

chmod +x ~/.chunkwmrc
chmod +x git_template/hooks/ctags
chmod +x git_template/hooks/post-checkout
chmod +x git_template/hooks/post-commit
chmod +x git_template/hooks/post-merge
chmod +x git_template/hooks/post-rewrite

/usr/local/bin/nvim +PlugInstall +qall

# oh my zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# zsh nvm
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

npm install --global pure-prompt
