#!/usr/bin/env bash

function nvim-findfiles() {
    nvim +'lua require("telescope.builtin").find_files({ find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" } })'
}

function nvim-oldfiles() {
    nvim +'Telescope oldfiles'
}
