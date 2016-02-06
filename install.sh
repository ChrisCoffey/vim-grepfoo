#!/bin/bash

DIR=`pwd`
OP=$1

for f in *.vim
do
    if [ "$OP" == "a" ] 
    then
        # making an assumption about where the neovim config is
        ln -sf "$DIR/$f" "$HOME/.config/nvim/plugins/$f"
    fi
    if [ "$OP" == "d" ] 
    then
        rm "$HOME/.config/nvim/plugins/$f"
    fi
done
