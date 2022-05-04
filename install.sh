#!/bin/bash

WORK_SPACE=$(cd $(dirname $0) && pwd)
cd $WORK_SPACE

# make symbolic link
cd $HOME
ln -s $WORK_SPACE/.vimrc $HOME/.vimrc
ln -s $WORK_SPACE/.tmux.conf $HOME/.tmux.conf
ln -s $WORK_SPACE/.my.cnf $HOME/.my.cnf
ln -s $WORK_SPACE/.grc $HOME/.grc
ln -s $WORK_SPACE/.gitconfig $HOME/.gitconfig
ln -s $WORK_SPACE/.agignore $HOME/.agignore

make .aliases
make vim-plugins
