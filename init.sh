#!/usr/bin/env bash

DOTFILES_DIR=$(pwd)
echo "==> Working dir: ${DOTFILES_DIR}"
cd ~

echo "==> Global gitignore"
ln -s ${DOTFILES_DIR}/gitignore_global .gitignore_global
git config --global core.excludesfile ~/.gitignore_global

echo "==> vimrc"
ln -s ${DOTFILES_DIR}/vimrc .vimrc

echo "==> byobu tmux fixes"
echo "==> TODO: if file empty/nonexistent, do symlink instead"
mkdir -p ~/.byobu
if [ -f ~/.byobu/.tmux.conf ]; then
    cat ${DOTFILES_DIR}/byobu/.tmux.conf >> ~/.byobu/.tmux.conf
fi

echo "==> Done!"
