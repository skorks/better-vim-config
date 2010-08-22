#!/bin/bash

initialdir=$(pwd)
scriptdir=$(dirname $0)
cd $scriptdir

#copy the main vim config to home directory
cp ./config/vimrc.linux ~/.vimrc
vimruntimedir=$(basename $(pwd))
cd ../

#make sure directory with all the plugins etc. is named .vimruntime
if [ $vimruntimedir != ".vimruntime" ]; then
  mv $vimruntimedir .vimruntime
fi

#if go back to directory where we initially kicked off the script if it still exists
if [ -d $initialdir ]; then
  cd $initialdir
else 
  cd ~/
fi 
echo "Vim configuration successfully installed!"
