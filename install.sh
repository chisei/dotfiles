#!/bin/bash

WORK_SPACE=$(cd $(dirname $0) && pwd)
cd $WORK_SPACE

# git submodule update
git submodule init
git submodule update

# vim NeoBundleInstall
vim -c "NeoBundleInstall" -c "quit"

# make symbolic link
cd $HOME
ln -s $WORK_SPACE/.zshrc $HOME/.zshrc
ln -s $WORK_SPACE/.vimrc $HOME/.vimrc
ln -s $WORK_SPACE/.tmux.conf $HOME/.tmux.conf
ln -s $WORK_SPACE/.my.cnf $HOME/.my.cnf
