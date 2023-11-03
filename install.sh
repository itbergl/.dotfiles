#!/usr/bin/env zsh

DOTFILES=$HOME/.dotfiles

# create sym links
ln -sf $DOTFILES/.zshrc $HOME/.zshrc
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf
