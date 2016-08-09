#!/bin/bash

DOT_FILES=(.zshrc .powconfig .tmux.conf .tigrc .vimrc .pryrc)

for file in ${DOT_FILES[@]}
do
  if [ -f "$HOME/$file" ]
  then
    cp $HOME/$file $HOME/$file+"_old"
    rm $HOME/$file
    ln -s $HOME/Codes/dotfiles/$file $HOME/$file
  else
    ln -s $HOME/Codes/dotfiles/$file $HOME/$file
  fi
done

source ~/.zshrc
exec -l $SHELL
