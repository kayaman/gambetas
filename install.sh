#!/bin/bash

cd $HOME
rm -rf gambetas .gambetas
git clone git@github.com:kayaman/gambetas.git

mv gambetas .gambetas

if [ -d "$HOME/bin" ]; then
  mkdir bin
fi

if [ -n "$ZSH_VERSION" ]; then
   SHELLRC=".zshrc"
elif [ -n "$BASH_VERSION" ]; then
   SHELLRC=".bashrc"
else
   echo "No support your shell..."
   exit 0
fi

for i in ~/.gambetas/cheats/*; do
  echo "Installing $(basename $i)..."
  source ~/.gambetas/$(basename $i)
done

echo "export PATH=$PATH:$HOME/bin" >> $HOME/$SHELLRC
source $HOME/$SHELLRC
