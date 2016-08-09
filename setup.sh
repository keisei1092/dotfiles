#!/bin/bash

DOT_FILES=(.zshrc .powconfig .tmux.conf .tigrc .vimrc .pryrc)

for file in ${DOT_FILES[@]}
do
  if [ -f "$HOME/$file" ]
  then
    cp $HOME/$file $HOME/$file"_old"
    rm $HOME/$file
    ln -s $HOME/Codes/dotfiles/$file $HOME/$file
  else
    ln -s $HOME/Codes/dotfiles/$file $HOME/$file
  fi
done

printf "\n\
#################################################### \n\
#    Thank you for using keisei1092's dotfiles!    # \n\
# if you want to remove old config files, do this: # \n\
#                                                  # \n\
#                 \`findrm \\*_old\`               # \n\
#################################################### "

source ~/.zshrc
exec -l $SHELL
