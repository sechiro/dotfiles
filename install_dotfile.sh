#!/bin/bash
set -ue

BASEDIR=$(cd $(dirname $0); pwd)
case $MACHTYPE in
    # MBA
    x86_64-apple-darwin12)
        VIMRC=$BASEDIR/.vimrc
        BASHRC=$BASEDIR/MBA_bashrc;;
    # linux
    x86_64-redhat-linux-gnu)
        VIMRC=$BASEDIR/.vimrc
        BASHRC=$BASEDIR/linux_bashrc;;
    *)
        exit 1;;
esac

# .vimrc
if [[ -f $HOME/.vimrc ]];then
    if [ $(diff $HOME/.vimrc $VIMRC | wc -l) == 0 ];then
        echo "same file"
    else
        mv $HOME/.vimrc $HOME/.vimrc_`date "+%Y%m%d-%H%M%S"`
        cp -f $VIMRC $HOME/.vimrc
        echo "$HOME/.vimrc has changed."
    fi
else
    cp -f $VIMRC $HOME/.vimrc
fi

#.bashrc
if [[ -f $HOME/.bashrc ]];then
    if [ $(diff $HOME/.bashrc $BASHRC | wc -l) == 0 ];then
        echo "same file"
    else
        mv $HOME/.bashrc $HOME/.bashrc_`date "+%Y%m%d-%H%M%S"`
        cp -f $BASHRC $HOME/.bashrc
        echo "$HOME/.bashrc has changed."
    fi
else
    cp -f $BASHRC $HOME/.bashrc
fi

