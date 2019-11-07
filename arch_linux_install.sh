#!/bin/bash

echo "Making /home/$(whoami)/dotfiles/"
mkdir -p ~/dotfiles

cp .vimrc ~/dotfiles/.vimrc
cp .zshrc ~/dotfiles/.zshrc
cp -r .vim ~/dotfiles/.vim
cp -r .oh-my-zsh ~/dotfiles/.oh-my-zsh

echo "Proceeding will destroy your dotfiles and symlink the dotfiles in this repo to the home directory. "
echo "Proceed? [Y/n]"
read resp

# Exit if response is not Y/y/
if [$resp != 'Y' -a $resp != 'Y']; do
	return 1
fi

# Install pacman packages.
sudo pacman -S - < pacman_list.txt

# Symlink files and folders.
ln -sf ~/dotfiles/.vimrc ~
ln -sf ~/dotfiles/.zshrc ~
ln -sf ~/dotfiles/.vim ~

# Symlink doesnt work. 
mv ~/dotfiles/.oh-my-zsh ~

# Install fonts.
sh fonts/powerline-fonts/install.sh 
cd fonts/nerd-fonts-hack && makepkg -si && cd -


