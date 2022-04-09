#!/bin/zsh

# setup git submodules
git submodules init
git submodules update

# setup gcm

# stow
cd $HOME/.dotstow
stow -v -R */
