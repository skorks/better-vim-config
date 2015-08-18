#!/bin/bash

# find the full path of the current script directory
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )

# symlink the config file and the folder with plugins etc
ln -s $SCRIPTPATH/vimrc ~/.vimrc
ln -s $SCRIPTPATH/.vim ~/.vim

#if go back to directory where we initially kicked off the script if it still exists
echo "Vim configuration successfully installed!"
