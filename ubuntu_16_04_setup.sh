#!/bin/sh

# Essentials =====

sudo apt-get update -y
sudo apt-get install -y build-essential
sudo apt-get install -y git

# zsh =====
# http://dev.classmethod.jp/tool/zsh-prezto/

zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

# Vim =====

sudo apt-get install -y vim-gnome

# Google Chrome =====

sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update -y
sudo apt-get install -y google-chrome-stable

# Google Japanese Input =====

sudo apt-get install -y ibus-mozc mozc-server mozc-utils-gui

# Ruby =====

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="~/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source ~/.bashrc

rbenv install 2.3.1
rbenv global 2.3.1

# dotfiles =====

git clone https://github.com/keisei1092/dotfiles.git

cd dotfiles
./setup.sh

cd ~
