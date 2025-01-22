#!/usr/bin/env bash

script_dir=$(dirname "$(realpath "$0")")
scripts_dir=$(dirname "$script_dir")

files=(zprofile zshenv zshrc aliases functions)

for file in "${files[@]}"; do
    echo "Creating symlink to $file in home directory."
    ln -sf "${scripts_dir}/zsh/.${file}" "$HOME"
done
