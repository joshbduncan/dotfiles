-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<leader>tu", function()
	vim.cmd("Undotree")
end, { desc = "Toggle Undotree" })
