#!/bin/bash

WORK_SPACE=$(cd $(dirname $0) && pwd)
cd $WORK_SPACE

# git submodule update
git submodule init
git submodule update

# make symbolic link
cd $HOME
ln -s $WORK_SPACE/.vim $HOME/.vim
ln -s $WORK_SPACE/.vimrc $HOME/.vimrc
ln -s $WORK_SPACE/.tmux.conf $HOME/.tmux.conf
ln -s $WORK_SPACE/.my.cnf $HOME/.my.cnf
ln -s $WORK_SPACE/.grc $HOME/.grc
ln -s $WORK_SPACE/.gitconfig $HOME/.gitconfig
ln -s $WORK_SPACE/.agignore $HOME/.agignore

# vim NeoBundleInstall
vim -c "NeoBundleInstall" -c "quit"
