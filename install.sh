#!/bin/bash

HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd )"

ln -sf $HERE/zshrc $HOME/.zshrc
ln -sf $HERE/zshenv $HOME/.zshenv


ZSH=$(command -v zsh)
command -v zsh && chsh -s $(command -v zsh)


SRC=$HERE/other_files/$(uname)
for f in $(find $SRC -type f); do
  dest=$(dirname "$HOME/${f#$SRC}")
  [ "$HOME" = "$dest" ] || mkdir -p $dest
  ln -sf $f $dest
done
