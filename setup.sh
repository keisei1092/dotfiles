#!/bin/bash

DOT_FILES=(.zshrc .powconfig .tmux.conf .tigrc .vimrc .xvimrc .pryrc)

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
#                                                  # \n\
#  (For Linux users: simply hit this:              # \n\
#    find . -maxdepth 1 -name '*_old' | xargs rm   # \n\
#  (Emacs configuration file 'init.el'             # \n\
#   isn't linked by this command. Please hit this: # \n\
#    cp init.el ~/.emacs.d/init.el                 # \n\
#    (Please check '~/.emacs.d' created)           # \n\
#################################################### "

source ~/.zshrc
exec -l $SHELL
