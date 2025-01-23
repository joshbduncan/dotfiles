#!/usr/bin/env bash

script_path="$(realpath "${BASH_SOURCE:-$0}")"
script_dir=$(dirname "$script_path")
dotfiles_dir=$(dirname "$script_dir")

files=(zprofile zshenv zshrc aliases functions)

for file in "${files[@]}"; do
    echo "Creating symlink to $file in home directory."
    ln -sf "${dotfiles_dir}/zsh/.${file}" "$HOME"
done
