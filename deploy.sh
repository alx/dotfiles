#!/usr/bin/zsh

#
# i3 - https://i3wm.org/
#
if [ ! -d "$HOME/.config" ]; then
  mkdir $HOME/.config
fi
rm -rf $HOME/.config/.i3
ln -sf $PWD/.config/i3 $HOME/.config/i3

rm -rf $HOME/.i3 $HOME/.i3blocks.conf
ln -sf $PWD/.i3 $HOME/.i3
ln -sf $PWD/.i3blocks.conf $HOME/.i3blocks.conf

#
# git config
#
rm -rf $HOME/.gitignore $HOME/.gitconfig
ln -sf $PWD/.gitignore $HOME/.gitignore
ln -sf $PWD/.gitconfig $HOME/.gitconfig

#
# zsh - http://ohmyz.sh/
#
rm -rf $HOME/.oh-my-zsh $HOME/.zshrc
ln -sf $PWD/.oh-my-zsh $HOME/.oh-my-zsh
ln -sf $PWD/.zshrc $HOME/.zshrc

#
# tmux - https://leanpub.com/the-tao-of-tmux/read
#
rm -rf $HOME/.tmux $HOME/.tmux.conf
ln -sf $PWD/.tmux $HOME/.tmux
ln -sf $PWD/.tmux.conf $HOME/.tmux.conf

#
# vim
#
rm -rf $HOME/.vim $HOME/.vimrc
ln -sf $PWD/.vim $HOME/.vim
ln -sf $PWD/.vimrc $HOME/.vimrc

#
# Xresources - solarized theme
# http://ethanschoonover.com/solarized
#
rm -rf $HOME/.Xresources
ln -sf $PWD/.Xresources $HOME/.Xresources

#
# fzf - A command-line fuzzy finder
# https://github.com/junegunn/fzf
#
rm -rf $HOME/.fzf $HOME/.fzf.zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#
# load new shell
#
zsh
