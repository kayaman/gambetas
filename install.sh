#!/bin/bash

cd $HOME
rm -rf ~/gambetas ~/.gambetas
git clone git@github.com:kayaman/gambetas.git
mv ~/gambetas ~/.gambetas
mv ~/.gambetas/.gambetasrc ~/

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

if [ ! [-f "$HOME/.my-gambetas.sh" ] ]; then
  mv ~/.gambetas/my-gambetas.sample.sh mv ~/.my-gambetas.sh
fi

echo "source ~/.gambetasrc" >> $HOME/$SHELLRC
echo "source ~/.my-gambetas.sh" >> $HOME/$SHELLRC
echo "export PATH=$PATH:$HOME/bin" >> $HOME/$SHELLRC
source $HOME/$SHELLRC
