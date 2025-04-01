local esc = vim.api.nvim_replace_termcodes("<esc>", true, true, true)


vim.api.nvim_create_augroup("LogMacro", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = "LogMacro",
	pattern = { "javascript", "typescript" },
	callback = function()
		vim.fn.setreg("l", "yoconsole.log(\"" .. esc .. "pa:" .. esc .. "la, " .. esc .. "pl")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = "LogMacro",
	pattern = { "javascriptreact" },
	callback = function()
		-- yoalert("^[pa:^[wi + ^[p
		vim.fn.setreg("l", "yoalert(\"" .. esc .. "pa: \"" .. esc .. "wi + " .. esc .. "pl")
	end,
})
