#!/usr/bin/env bash

paths=(
    "${SCRIPTS}/bash/fixme.sh"
    "${REPOS}/escompile/escompile.sh"
)

for path in "${paths[@]}"; do
    filename="${path##*/}"
    bin_name="${filename%.*}"
    echo "Creating symlink to $bin_name in bin directory."
    ln -s "$path" "${HOME}/.local/bin/${bin_name}"
done
