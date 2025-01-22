local map = vim.keymap.set

-- clear highlights on search when pressing <Esc> in normal mode
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

--  see `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })

-- executing lua (current file, current line, visual selection)
map("n", "<leader>ef", "<cmd>source %<CR>", { desc = "Lua [E]xecute Current [F]ile" })
map("n", "<leader>el", ":.lua<CR>", { desc = "Lua [E]xecute Current [L]ine" })
map("v", "<leader>es", ":lua<CR>", { desc = "Lua [E]xecute [V]isual Selection" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bd", "<cmd>lua MiniBufremove.delete()<cr>", { desc = "Delete Buffer" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- open MiniFiles
map("n", "<C-\\>", ":lua MiniFiles.open()<CR>")

-- ESRunner
map({ "n", "v" }, "<leader>er", "<cmd>ESRunner run<CR>", { desc = "[E]SRunner [R]un" })
