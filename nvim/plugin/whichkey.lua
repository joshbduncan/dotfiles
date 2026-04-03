local which_key = require("which-key")

which_key.setup({
	spec = {
		{ "<leader>f", group = "[F]ind" },
		{ "<leader>g", group = "[G]it and [G]o" },
		{ "<leader>s", group = "[S]earch" },
		{ "<leader>t", group = "[T]oggle" },
	},
})

vim.keymap.set("n", "<leader>?", function()
	which_key.show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
