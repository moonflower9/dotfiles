#!/bin/sh
# env vars to set on login, zsh settings in ~/config/zsh/.zshrc
# add `export ZDOTDIR="$HOME/.config/zsh"` to /etc/zsh/zshenv in order to place this file at .config/zsh/.zprofile

# default programs
export EDITOR="nvim"
export BROWSER="firefox"

# bootstrap .zshrc to ~/.config/zsh/.zshrc, any other zsh config files can also reside here
ZDOTDIR=~/.config/zsh
