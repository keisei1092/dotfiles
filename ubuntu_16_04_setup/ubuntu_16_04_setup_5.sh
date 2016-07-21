#!/bin/sh

# rbenv =====

source ~/.zshrc

rbenv install 2.3.1
rbenv global 2.3.1

# dotfiles =====

git clone https://github.com/keisei1092/dotfiles.git

cd dotfiles
./setup.sh

cd ~
