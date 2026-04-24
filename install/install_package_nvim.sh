#!/bin/bash

echo "Installing dependencies for Neovim..."
sudo pacman -Syu --needed neovim git nodejs npm python-pip python-pynvim unzip wget curl tree-sitter ripgrep fd fd-find
