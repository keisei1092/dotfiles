 #!/bin/bash

  DOT_FILES=(.zshrc .powconfig .tmux.conf .tigrc .vimrc)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/Codes/dotfiles/$file $HOME/$file
 done
