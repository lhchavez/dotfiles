#!/bin/bash

set -e

SCRIPT=`realpath $0`
ROOT=`dirname $SCRIPT`
ROOT=`dirname $ROOT`

if [ ! -d $ROOT/third_party/vim/.git ]; then
	(cd $ROOT && git submodule update --init third_party/vim)
fi

sudo apt install -y python3-dev

cd $ROOT/third_party/vim
make distclean
LDFLAGS="-Wl,-Bsymbolic-functions -Wl,-z,relro -Wl,-z,now" CPPFLAGS="-Wdate-time" \
	CFLAGS="-g -O2 -fstack-protector-strong -Wformat -Werror=format-security" \
	./configure --prefix=/usr --mandir=/usr/share/man --without-local-dir \
	--enable-fail-if-missing --enable-cscope --enable-gpm --enable-selinux \
	--disable-smack --with-features=huge --enable-multibyte --enable-acl \
	--without-x --enable-gui=no --disable-luainterp --disable-mzschemeinterp \
	--disable-perlinterp --enable-python3interp \
	--with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
	--disable-pythoninterp --disable-rubyinterp --disable-tclinterp
make -j6
sudo make install
