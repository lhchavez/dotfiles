#!/bin/bash

set -e

SCRIPT=`realpath $0`
ROOT=`dirname $SCRIPT`
ROOT=`dirname $ROOT`

ln -f -s $ROOT/vim/vimrc ~/.vimrc
ln -f -s $ROOT/tmux/tmux.conf ~/.tmux.conf

# Install Vundle.
$ROOT/vim/vundle.sh
