local nvim_treesitter = require("nvim-treesitter")

nvim_treesitter.setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
	highlight = { enable = true },
	indent = { enable = true },
})

nvim_treesitter.install({
	"bash",
	"c",
	"diff",
	"html",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"query",
	"vim",
	"vimdoc",
})
