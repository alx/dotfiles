#!/bin/bash

#
# i3 - https://i3wm.org/
#
if [ ! -d "$DIRECTORY" ]; then
  mkdir $HOME/.config
fi
ln -sf .config/i3 $HOME/.config/i3

rm -rf $HOME/.i3 $HOME/.i3blocks.conf
ln -sf .i3 $HOME/.i3
ln -sf .i3blocks.conf $HOME/.i3blocks.conf

#
# git config
#
rm -rf $HOME/.git $HOME/.gitignore
ln -sf .git $HOME/.git
ln -sf .gitignore $HOME/.gitignore

#
# zsh - http://ohmyz.sh/
#
rm -rf $HOME/.oh-my-zsh $HOME/.zshrc
ln -sf .oh-my-zsh $HOME/.oh-my-zsh
ln -sf .zshrc $HOME/.zshrc

#
# tmux - https://leanpub.com/the-tao-of-tmux/read
#
rm -rf $HOME/.tmux $HOME/.tmux.conf
ln -sf .tmux $HOME/.tmux
ln -sf .tmux.conf $HOME/.tmux.conf

#
# vim
#
rm -rf $HOME/.vim $HOME/.vimrc
ln -sf .vim $HOME/.vim
ln -sf .vimrc $HOME/.vimrc

#
# Xresources - solarized theme
# http://ethanschoonover.com/solarized
#
rm -rf $HOME/.Xresources
ln -sf .Xresources $HOME/.Xresources

#
# load new shell
#
source $HOME/.zshrc
