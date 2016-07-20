#!/usr/bin/env bash

# --- 
# Installation Script For MAC OSX
# --- 

# Install vim settings
echo "Installing Vim settings to ${HOME}"
cp -rf vim ${HOME}/.vim
cp -rf vimrc ${HOME}/.vimrc

# Install Homebrew
echo "Installing HomeBrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Pip
echo "Install Pip"
sudo easy_install pip

# Install Workspaces
echo "Installing Workspaces to:"
echo "${HOME}/Workspaces"
mkdir -p ${HOME}/Workspaces

# Install Git Configuration
echo "Installing Git Configuraiton"
brew install git
git config --global color.ui true
git config --global user.name "enpfeff"
git config --global user.email "enpfeff@gmail.com"

# Installing Fish
echo "Installing Fish"
brew install Fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
mkdir -p ~/.config/fish
touch ~/.config/fish/config.fish
echo "set -g -x PATH /usr/local/bin $PATH" >>  ~/.config/fish/config.fish
echo "set -g -x fish_greeting 'Hello enpfeff'" >> ~/.config/fish/config.fish

# Install Fisherman
echo "Installing Fisherman"
echo "" >> ~/.config/fish/config.fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

# Install Oh My Fish
echo "Installing Oh My Fish"
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
omf update

# Install bob the fish theme
echo "Installing theme for Fish"
omf install bobthefish
echo "# Personal" >> ~/.config/fish/config.fish
echo "set -g theme_nerd_fonts yes" >> ~/.config/fish/config.fish
echo "set -g theme_color_scheme solarized" >> ~/.config/fish/config.fish
echo "set -g theme_display_date no" >> ~/.config/fish/config.fish
echo "set -g theme_powerline_fonts yes" >> ~/.config/fish/config.fish

# Install Powerline fonts
echo "Installing Powerline fonts --> this will take awhile"
(cd ${HOME}/Workspaces && git clone git@github.com:powerline/fonts.git && cd fonts && bash ./install.sh)
