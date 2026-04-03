local servers = {
	"basedpyright", -- replaced pyright
	"bashls",
	"lua_ls",
	"ruff",
	"ts_ls",
}

-- get rid of the pesky undefined global 'vim' warnings
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end
