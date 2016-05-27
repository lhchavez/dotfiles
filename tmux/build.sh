#!/bin/bash

set -e

if [ ! -d ~/tmux ]; then
	git clone https://github.com/tmux/tmux.git ~/tmux
	cd ~/tmux
	git checkout 2.2
fi
sudo apt-get build-dep tmux
cd ~/tmux
if [ -f Makefile ]; then
	make clean
fi
sh autogen.sh
./configure --prefix=/usr
make -j6
sudo make install
