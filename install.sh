#!/bin/bash
# Symlink dotfiles from this repo to home directory

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

files=(zshrc tmux.conf vimrc bash_profile gitconfig)

for file in "${files[@]}"; do
    target="$HOME/.$file"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing .$file to .$file.bak"
        mv "$target" "$target.bak"
    fi
    ln -sf "$DOTFILES_DIR/$file" "$target"
    echo "Linked .$file -> $DOTFILES_DIR/$file"
done
