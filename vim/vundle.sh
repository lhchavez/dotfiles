#!/bin/bash

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	mkdir -p ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
