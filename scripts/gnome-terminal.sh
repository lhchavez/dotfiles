#!/bin/bash

set -e

SCRIPT=`realpath $0`
ROOT=`dirname $SCRIPT`
ROOT=`dirname $ROOT`

if [ ! -d $ROOT/third_party/tomorrow-theme/.git ]; then
	(cd $ROOT && git submodule update --depth 1 --init third_party/tomorrow-theme/)
fi

$ROOT/third_party/tomorrow-theme/Gnome-Terminal/setup-theme.sh
