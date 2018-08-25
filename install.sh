#!/bin/bash

cd $HOME
rm -rf ~/gambetas ~/.gambetas
git clone git@github.com:kayaman/gambetas.git
mv ~/gambetas ~/.gambetas

if [[ ! -d "$HOME/bin" ]]
then
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

if [[ ! -f ~/.my-gambetas.sh ]]
then
  mv ~/.gambetas/my-gambetas.sample.sh ~/.my-gambetas.sh
fi

echo "source ~/.gambetas/.gambetasrc" >> $HOME/$SHELLRC
echo "source ~/.my-gambetas.sh" >> $HOME/$SHELLRC
echo "export PATH=$PATH:$HOME/bin" >> $HOME/$SHELLRC
source $HOME/$SHELLRC
