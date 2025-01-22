#!/usr/bin/env bash

# Show nvim oldfiles in fzf picker and open selected file(s) in nvim

# Dependencies:
#   1. nvim | Vim-fork focused on extensibility and usability
#   2. fzf  | command-line fuzzy finder

old_files=($(nvim -u NONE --headless +'lua io.write(table.concat(vim.v.oldfiles, "\n") .. "\n")' +qa))

# filter invalid paths or files not found
valid_files=()
for file in "${old_files[@]}"; do
    if [[ -f "$file" ]]; then
        valid_files+=("$file")
    fi
done

# use fzf to filter files
files=($(
    printf "%s\n" "${valid_files[@]}" |
        grep -v '\[.*]' |
        fzf --multi \
            --preview 'bat -n --color=always {}'
))

# open files in nvim
[[ ${#files[@]} -gt 0 ]] && nvim "${files[@]}"
