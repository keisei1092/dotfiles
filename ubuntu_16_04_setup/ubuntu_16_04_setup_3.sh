#!/bin/sh

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
