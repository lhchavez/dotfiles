#!/bin/bash

if [ ! -d ~/tmux ]; then
	git clone https://github.com/tmux/tmux.git ~/tmux
	cd ~/tmux
	git checkout 2.2
fi
sudo apt-get build-dep tmux
cd ~/tmux
sh autogen.sh
./configure --prefix=/usr
make -j6
sudo make install
