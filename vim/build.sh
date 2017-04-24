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
LDFLAGS='-Wl,-E  -Wl,-Bsymbolic-functions -fPIE -pie -Wl,-z,relro -Wl,-z,now -Wl,--as-needed' \
	CFLAGS='-Wdate-time  -g -O2 -fPIC -fPIE -fstack-protector-strong -Wformat -Werror=format-security -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1' \
	./configure --enable-python3interp=yes --enable-multibyte --enable-rubyinterp=yes --with-python-config-dir=/usr/lib/python3/config \
	--enable-tclinterp=yes --enable-perlinterp=yes --enable-luainterp=yes --enable-cscope --prefix=/usr
make -j6
sudo make install
