#!/bin/bash
set -uex
script_dir=$(cd $(dirname $0) && pwd)

# vim
sudo yum -y install git man wget vim-enhanced
if [ ! -f ~/.vimrc ];then
    curl -s https://raw.github.com/sechiro/dotfiles/master/.vimrc -o ~/.vimrc
fi
mkdir -p ~/.vim/bundle
if [ ! -e ~/.vim/bundle/neobundle.vim ];then
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
fi

cp -r $script_dir/.vim/mysnippets ~/.vim/
