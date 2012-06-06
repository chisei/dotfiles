#!/bin/bash
# install bashrc

CURRENT_DIR=${0%%install.sh}
BASHRC=~/.bashrc

if [ -e $BASHRC ]; then
# file exists
    echo "source $CURRENT_DIR/.bashrc" >> $BASHRC
else
# file not exists
    cp $CURRENT_DIR/.bashrc ~/
fi
