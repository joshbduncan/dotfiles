#!/usr/bin/env bash

# FIXME - Find dev comment tags and Markdown tasks using ripgrep and FZF. Selected tag or task opens in your \$EDITOR.

# Dependencies:
#   1. rg  | recursively search current directory for lines matching a pattern
#   2. fzf | command-line fuzzy finder
#   3. bat | a cat clone with syntax highlighting and Git integration

# Copyright 2024 Josh Duncan
# https://joshbduncan.com

# set -x
set -Eeuo pipefail

VERSION="0.0.1"

# setup defaults
BASE_DIR=""
TAGS=("BUG" "HACK" "FIXME" "TODO" "-\s\[\s\]" "-\s\[x\]")
COMMENT_STRINGS=("/*" "#" "<!--" ";" "-" "--" "---")

# set usage options
USAGE_OPTS="[-h] [-r] [--version] [PATH]"
usage() {
    printf "usage: %s %s\n" "${0##*/}" "$USAGE_OPTS" >&2
}

# set help menu
help() {
    cat <<EOF
usage: ${0##*/} $USAGE_OPTS

Find dev comment tags and Markdown tasks using ripgrep and FZF. Selected tag or task opens in your \$EDITOR.

NOTES:
  Default Comments       */, #, <!--, ;, -
  Default Tags           BUG, HACK, FIXME, TODO, [ ], and [x]
  Markdown Tasks         Negate matching Markdown tasks with '!['

Arguments:
  [PATH]                 Path to search within. Defaults to current working directory.

Options:
  -h, --help             Print this help message.
  -r, --raw              Send raw (rg) results to STDOUT. 
      --version          Print version.
EOF
    exit
}

version() {
    printf "%s %s\n" "${0##*/}" "$VERSION"
}

# parse cli args
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
        -h | -\? | --help)
            help
            ;;
        -r | --raw)
            RAW=1
            break
            ;;
        --version)
            version
            exit
            ;;
        --) # End of args.
            shift
            break
            ;;
        -?*)
            usage
            printf "%s: error: unrecognized arguments: %s\n" "${0##*/}" "$1" >&2
            exit 2
            ;;
        *)
            BASE_DIR="$1"
            break
            ;;
        esac
        shift
    done

    return 0
}

# ensure required dependencies are available on the system
DEPENDENCIES="rg fzf bat"
for DEP in $DEPENDENCIES; do
    command -v "$DEP" >/dev/null 2>&1 || {
        echo "command '$DEP' not found..." >&2
        DEPS=1
    }
done
[[ ${DEPS:-0} -ne 1 ]] || {
    echo "Install the above dependencies and rerun this script." >&2
    exit 1
}

# combine the tags into a regex OR string and build the final regex for ripgrep
TAGS_GROUP=$(
    IFS=\|
    echo "${TAGS[*]}"
)
COMMENT_STRINGS_GROUP=$(
    IFS=\|
    echo "${COMMENT_STRINGS[*]}"
)
REGEX="($COMMENT_STRINGS_GROUP)\s+($TAGS_GROUP)"

# parse script arguments
parse_args "$@"

# run ripgrep to find all matches
# shellcheck disable=SC2086
MATCHES=$(rg --vimgrep --trim "$REGEX" $BASE_DIR)

[[ ${RAW:-0} -ne 1 ]] || {
    echo "$MATCHES"
    exit 0
}

# pipe all matches into fzf and return the result
RESULT=$(
    echo "$MATCHES" | fzf \
        --layout=reverse \
        --ansi \
        --delimiter :
)

# open the selected file on the selected line
IFS=:
read -ra SELECTED <<<"$RESULT"
[ -n "${SELECTED[0]}" ] && $EDITOR "${SELECTED[0]}" "+${SELECTED[1]}"
