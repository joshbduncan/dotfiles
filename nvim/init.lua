-- set space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- allow some plugins to use nerd font features
vim.g.have_nerd_font = true

-- add built-in plugins
vim.cmd("packadd nvim.undotree")
vim.cmd("packadd nohlsearch")
vim.cmd("packadd nvim.tohtml")

-- build hooks (before vim.pack.add() so they run on first install)
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if kind ~= "install" and kind ~= "update" then
			return
		end

		if name == "nvim-treesitter" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		elseif name == "LuaSnip" then
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
		end
	end,
})

-- add-on plugins
-- plugin setup and options loaded from files in /plugin
-- https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack
vim.pack.add({
	"https://github.com/mofiqul/dracula.nvim",

	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",

	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/folke/snacks.nvim",

	"https://github.com/tpope/vim-sleuth",

	"https://github.com/stevearc/conform.nvim",

	"https://github.com/folke/flash.nvim",

	"https://github.com/folke/which-key.nvim",

	"https://github.com/lewis6991/gitsigns.nvim",

	"https://github.com/mg979/vim-visual-multi",

	-- completion, snippets
	"https://github.com/rafamadriz/friendly-snippets",
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.x") },
	"https://github.com/saghen/blink.compat",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },

	-- lsp, formatting, linting
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
})

require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.funcs")

vim.diagnostic.config({
	virtual_lines = {
		current_line = true,
	},
})
