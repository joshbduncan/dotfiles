local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep

vim.keymap.set({ "i" }, "<C-K>", function()
	ls.expand()
end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load()

ls.add_snippets("javascript", {
	s("clg", {
		t('console.log("'),
		i(1, "value"),
		t(': ", '),
		rep(1),
		t(");"),
	}),
})

ls.add_snippets("typescript", {
	s("clg", {
		t('console.log("'),
		i(1, "value"),
		t(': ", '),
		rep(1),
		t(");"),
	}),
})

ls.add_snippets("javascriptreact", {
	s("alr", {
		t('alert("'),
		i(1, "value"),
		t(': " + '),
		rep(1),
		t(")"),
	}),
})
