#!/usr/bin/env bash

DOTFILES_DIR=$(pwd)
echo "==> Working dir: ${DOTFILES_DIR}"
cd ~

echo "==> Global gitignore"
ln -sv ${DOTFILES_DIR}/gitignore_global .gitignore_global
git config --global core.excludesfile ~/.gitignore_global

echo "==> vim"
ln -sv ${DOTFILES_DIR}/vimrc .vimrc

echo "==> byobu tmux fixes"
echo "==> TODO: if file empty/nonexistent, do symlink instead"
mkdir -pv ~/.byobu
if [ -s ~/.byobu/.tmux.conf ]; then
    echo "appending custom tmux conf into ~/.byobu/.tmux.conf"
    cat ${DOTFILES_DIR}/byobu/.tmux.conf >> ~/.byobu/.tmux.conf
fi

echo "==> Mouse button binding"
ln -sv ${DOTFILES_DIR}/.xbindkeysrc ~/.xbindkeysrc

echo "==> Personal scripts"
if [ -d ~/bin ]; then
    echo "ERROR: ~/bin directory exist, check manually!"
else
    echo "symlinking bin folder"
    ln -sv ${DOTFILES_DIR}/bin bin
fi

echo "==> Done!"
