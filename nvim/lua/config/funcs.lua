-- Find dev comment tags and Markdown tasks using ripgrep.
-- All matches are sent to the quickfix list and opened in Telescope.
vim.api.nvim_create_user_command("FixMe", function()
	if vim.fn.executable("rg") == 0 then
		print("Executable rg (ripgrep) not found. Install and rerun.")
		return
	end

	local tags = { "BUG", "HACK", "FIXME", "TODO", "-\\s\\[\\s\\]", "-\\s\\[x\\]" }
	local comment_strings = { "/*", "\\#", "<!--", ";", "-", "--", "---" }
	local regex = "'(" .. table.concat(comment_strings, "\\|") .. ")\\s+(" .. table.concat(tags, "\\|") .. ")'"

	vim.o.grepprg = "rg --vimgrep --trim"
	vim.cmd("silent grep! " .. regex)
	vim.cmd("Telescope quickfix")
end, {})

-- Print current buffer to default printer
vim.api.nvim_create_user_command("Print", function()
	-- TODO: add check for unsaved buffer
	local fp = vim.fn.fnameescape(vim.fn.expand("%:p"))
	vim.cmd(string.format("!lp %s", fp))
end, {})
