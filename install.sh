#!/bin/bash

cd $HOME
git clone git@github.com:kayaman/gambetas.git

if [ -d "$HOME/bin" ]; then
  mkdir bin
fi

if [ -n "$ZSH_VERSION" ]; then
   SHELLRC=".zshrc"
elif [ -n "$BASH_VERSION" ]; then
   SHELLRC=".bashrc"
else
   echo "I do not support your shell, pu"
fi

# TODO: install the functions

# for i in ~/.dotfiles/dotfiles/*; do
#   echo "Installing $(basename $i)..."
#   rm -rf ~/.$(basename $i)
#   ln -s $i ~/.$(basename $i)
# done


echo "export PATH=$PATH:$HOME/bin" >> $HOME/$SHELLRC
source $HOME/$SHELLRC
