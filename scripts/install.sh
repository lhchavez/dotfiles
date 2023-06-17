#!/bin/bash

set -e

SCRIPT=`realpath $0`
ROOT=`dirname $SCRIPT`
ROOT=`dirname $ROOT`

# Build neovim
if [[ "$(nvim --version | grep 'NVIM v' || true)" < "NVIM v0.8" ]]; then
  BUILD_DIR="$(mktemp -d /tmp/neovim.XXXXXX)"
  trap "rm -rf ${BUILD_DIR}" EXIT

  git clone -b stable --depth=1 https://github.com/neovim/neovim "${BUILD_DIR}"
  (cd "${BUILD_DIR}" && \
   make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/usr && \
   cd build && \
   cpack -G DEB && \
   sudo dpkg -i nvim-linux64.deb)
fi

mkdir -p ~/.config/nvim
ln -f -s $ROOT/nvim/init.vim ~/.config/nvim/init.vim
ln -f -s $ROOT/nvim/lua/ ~/.config/nvim/
ln -f -s $ROOT/tmux/tmux.conf ~/.tmux.conf
