#!/bin/bash

set -e

if [ ! -d ~/vim ]; then
	git clone https://github.com/vim/vim.git ~/vim
	cd ~/vim
	git checkout v7.4.1832
fi
cd ~/vim
sudo apt-get build-dep vim-gtk
make distclean
LDFLAGS='-Wl,-E  -Wl,-Bsymbolic-functions -fPIE -pie -Wl,-z,relro -Wl,-z,now -Wl,--as-needed' \
	CFLAGS='-Wdate-time  -g -O2 -fPIE -fstack-protector-strong -Wformat -Werror=format-security -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1' \
	./configure --enable-pythoninterp=yes --enable-python3interp=yes --enable-multibyte --enable-rubyinterp=yes \
	--with-python-config-dir=/usr/lib/python3/config --enable-tclinterp=yes --enable-perlinterp=yes --enable-luainterp=yes \
	--enable-cscope --prefix=/usr --enable-gui=gnome2 --enable-gnome-check
make -j6
sudo make install
