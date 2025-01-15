#!/usr/bin/env zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

# Update the path array
path=(
    $path            # Keep existing PATH entries
    $HOME/.local/bin # pipx
    $HOME/.cargo/bin # rust cargo
    /Library/Frameworks/Python.framework/Versions/3.13/bin
)

# Ensure unique entries in the path
typeset -U path

# Export PATH by joining array elements with colons
export PATH=$(echo $path | tr ' ' ':')
