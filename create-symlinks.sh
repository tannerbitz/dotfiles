#!/usr/bin/env bash

dotfiles_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo rm -rf ~/.config/i3
sudo rm -rf ~/.config/nvim
sudo rm -rf ~/.config/tmux
sudo rm -rf ~/.config/scripts

ln -sf $dotfiles_dir/xdg_config/i3 ~/.config/i3
ln -sf $dotfiles_dir/xdg_config/nvim ~/.config/nvim
ln -sf $dotfiles_dir/xdg_config/tmux ~/.config/tmux
ln -sf $dotfiles_dir/xdg_config/scripts ~/.config/scripts
