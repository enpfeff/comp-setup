#!/usr/bin/env bash

# --
# Installation Script for Ubuntu
# --

# Install Vim Settings
echo "Installing Vim settings to ${HOME}"
cp -rf vim ${HOME}/.vim
cp -rf vimrc ${HOME}/.vimrc

# Install Workspaces
echo "Installing Workspaces to:"
echo "${HOME}/Workspaces"
mkdir -p ${HOME}/Workspaces

# Install Git Config
echo "Installing Git Configuration"
git config --global color.ui true
git config --global user.name "enpfeff"
git config --global user.email "enpfeff@gmail.com"

# Install Fish
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get -y install fish
chsh -s /usr/bin/fish
mkdir -p ~/.config/fish
touch ~/.config/fish/config.fish
echo "set -g -x fish_greeting 'Hello enpfeff'" >> ~/.config/fish/config.fish

# Install Fisherman
echo "Installing Fisherman"
echo "" >> ~/.config/fish/config.fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

# Install Oh My Fish
echo "Installing Oh My Fish"
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > install
fish install&
echo "Waiting for fish to install"
sleep 30
rm -f install

# Install bob the fish theme
echo "Installing theme for Fish"
echo "omf install bobthefish" | fish
echo "# Personal" >> ~/.config/fish/config.fish
echo "set -g theme_nerd_fonts yes" >> ~/.config/fish/config.fish
echo "set -g theme_color_scheme solarized" >> ~/.config/fish/config.fish
echo "set -g theme_display_date no" >> ~/.config/fish/config.fish
echo "set -g theme_powerline_fonts yes" >> ~/.config/fish/config.fish

# Install Powerline fonts
echo "Installing Powerline fonts --> this will take awhile"
(cd ${HOME}/Workspaces && git clone git@github.com:powerline/fonts.git && cd fonts && bash ./install.sh)

