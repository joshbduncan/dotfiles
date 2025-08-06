local map = vim.keymap.set

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
