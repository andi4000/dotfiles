#!/usr/bin/env bash

cd ~

echo "==> Global gitignore"
ln -s .dotfiles/gitignore_global .gitignore_global
git config --global core.excludesfile ~/.gitignore_global

echo "==> vimrc"
ln -s .dotfiles/vimrc .vimrc

echo "==> Done!"
