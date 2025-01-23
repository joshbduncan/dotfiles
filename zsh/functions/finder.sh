#!/usr/bin/env bash

# ~~~~~~~~~~ Mac Finder Functions ~~~~~~~~~~

# Show/hide hidden files in the Finder
alias finder-showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias finder-hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Show/Hide Desktop Icons
alias finder-cleandesk="defaults write com.apple.finder CreateDesktop false; killall Finder"
alias finder-messydesk="defaults write com.apple.finder CreateDesktop true; killall Finder"

# open passed dirs in Finder or cwd if no args
function finder-open {
    if ((!$#)); then
        open $PWD
    else
        open "$@"
    fi
}

# get path of front Finder window
function finder-window() {
    osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (insertion location as alias)
    end tell
EOF
}

# cd to the front Finder window
function finder-cd() {
    cd "$(finder-window)" || exit
}

# get paths of front Finder window selection
function finder-selection() {
    osascript 2>/dev/null <<EOF
    set paths to ""
    tell application "Finder" to set the_selection to selection
    set item_count to count the_selection
    repeat with item_index from 1 to count the_selection
      if item_index is less than item_count then set the_delimiter to "\n"
      if item_index is item_count then set the_delimiter to ""
      set paths to paths & ((item item_index of the_selection as alias)'s POSIX path) & the_delimiter
    end repeat
EOF
}

# open file with Quick Look
function finder-ql() {
    (($# > 0)) && qlmanage -p "$*" &>/dev/null &
}
