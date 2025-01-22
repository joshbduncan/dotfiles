#!/usr/bin/env zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

path=(
    $path            # Keep existing PATH entries
    $HOME/.local/bin # uv tool
    $HOME/.cargo/bin # rust cargo
    /Library/Frameworks/Python.framework/Versions/3.13/bin
)

# ensure unique entries
typeset -U path

export PATH=$(echo $path | tr ' ' ':')
