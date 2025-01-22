-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.autocmds")
require("config.funcs")
require("config.globals")
require("config.keymaps")
require("config.options")

require("config.lazy")
