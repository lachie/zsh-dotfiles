#!/bin/bash

ln -sf `pwd`/zshrc $HOME/.zshrc
ln -sf `pwd`/zshenv $HOME/.zshenv
ln -sf `pwd` $HOME/.zsh
chsh -s /bin/zsh

