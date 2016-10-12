#!/bin/sh

# zsh =====
# http://dev.classmethod.jp/tool/zsh-prezto/

sudo apt-get install -y zsh

zsh # => please type keys to configure zsh.

# zprezto =====

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh
