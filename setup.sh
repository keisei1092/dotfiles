#!/bin/bash

DOT_FILES=(.zshrc .powconfig .tmux.conf .tigrc .vimrc .pryrc)

for file in ${DOT_FILES[@]}
do
  if [ -f "$HOME/$file" ]
  then
    mv $HOME/$file $HOME/$file_`date +%Y%m%d`
    ln -s $HOME/Codes/dotfiles/$file $HOME/$file
  else
    ln -s $HOME/Codes/dotfiles/$file $HOME/$file
  fi
done
