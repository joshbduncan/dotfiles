#!/usr/bin/env bash

# Search man pages with fzf
function fzf-man-pages() {
    compgen -c | fzf | xargs man
}


# Show notes in fzf picker and open selected note(s) in nvim
function snotes() {
    local notes
    # notes=$(find "$NOTES" -type f \( -iname '*.md' -o -iname '*.txt' \))
    
    # use fzf to filter files
    notes=($(find "$NOTES" -type f \( -iname '*.md' -o -iname '*.txt' \) | fzf --multi --preview 'bat -n --color=always {}'))

    # open file in nvim
    [[ ${#notes[@]} -gt 0 ]] && nvim "${notes[@]}"
}

# Explore latest git diff in fzf
#   1. fzf  | command-line fuzzy finder
function fzf-gitdiff() {
    commit=${1:-HEAD}
    git show --stat=120 --format="" "$commit" | \
        grep -E '^\s*\S+.*\|' | \
        fzf --ansi \
        --disabled \
        --bind 'j:down,k:up,q:abort' \
        --preview="echo {} | sed 's/|.*//' | xargs -I% git show --color=always $commit -- %" \
        --preview-window=right:60%
}

# Play with JSON data using jq and fzf
# arg1: json file

# Dependencies:
#   1. fzf  | command-line fuzzy finder
function fzf-jq-playground() {
    printf '' | fzf --print-query \
        --preview "jq -C {q} '$1' 2>&1" \
        --preview-window=up:80%
}

# Show nvim oldfiles in fzf picker and open selected file(s) in nvim
# arg1: image file

# Dependencies:
#   1. nvim | Vim-fork focused on extensibility and usability
#   2. fzf  | command-line fuzzy finder
function fzf-oldfiles() {
    local old_files
    old_files=($(nvim -u NONE --headless +'lua io.write(table.concat(vim.v.oldfiles, "\n") .. "\n")' +qa))

    # filter invalid paths or files not found
    local valid_files=()
    for file in "${old_files[@]}"; do
        if [[ -f "$file" ]]; then
            valid_files+=("$file")
        fi
    done

    # use fzf to filter files
    files=($(printf "%s\n" "${valid_files[@]}" | grep -v '\[.*]' | fzf --multi --preview 'bat -n --color=always {}'))

    # open files in nvim
    [[ ${#files[@]} -gt 0 ]] && nvim "${files[@]}"
}

# Search files in fzf picker using zoxide and open selected file(s) in $EDITOR
# arg1: directory to search (default: current directory)

# Dependencies:
#   1. zoxide | a smarter cd command, inspired by z and autojump
function fzf-zoxide() {
    local file
    local lines
    local line_count

    if [ -z "$1" ]; then
        local file
        # use fd with fzf to select & open a file when no arg are provided
        file="$(fd --type f -I -H -E .git -E .git-crypt -E .cache -E .backup | fzf --height=70% --preview='bat -n --color=always --line-range :500 {}')"
        if [ -n "$file" ]; then
            $EDITOR "$file"
        fi
    else
        # handle when an arg is provided
        lines=$(zoxide query -l "$1" | xargs -I {} fd --type f -I -H -E .git -E .git-crypt -E .cache -E .backup -E .vscode "$1" {} | fzf --no-sort) # Initial filter attempt with fzf
        line_count="$(echo "$lines" | wc -l | xargs)"                                                                                               # Trim any leading spaces

        if [ -n "$lines" ] && [ "$line_count" -eq 1 ]; then
            # looks for the exact ones and opens it
            file="$lines"
            $EDITOR "$file"
        elif [ -n "$lines" ]; then
            # if multiple files are found, allow further selection using fzf and bat for preview
            file=$(echo "$lines" | fzf --query="$1" --height=70% --preview='bat -n --color=always --line-range :500 {}')
            if [ -n "$file" ]; then
                $EDITOR "$file"
            fi
        else
            echo "No matches found." >&2
        fi
    fi
}
