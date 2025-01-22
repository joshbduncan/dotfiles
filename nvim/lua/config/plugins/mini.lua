return {
	{
		"echasnovski/mini.nvim",
		config = function()
			local statusline = require("mini.statusline")
			statusline.setup({ use_icons = true })
			require("mini.files").setup()

			local notify = require("mini.notify")
			notify.setup({})
			vim.notify = notify.make_notify()

			require("mini.move").setup()

			require("mini.comment").setup({
				opts = {
					options = {
						custom_commentstring = function()
							return require("ts_context_commentstring.internal").calculate_commentstring()
								or vim.bo.commentstring
						end,
					},
				},
			})

			require("mini.pairs").setup({
				opts = {
					-- skip autopair when next character is one of these
					skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
					-- skip autopair when the cursor is inside these treesitter nodes
					skip_ts = { "string" },
					-- skip autopair when next character is closing pair
					-- and there are more closing pairs than opening pairs
					skip_unbalanced = true,
					-- better deal with markdown code blocks
					markdown = true,
				},
			})

			require("mini.bufremove").setup()

			-- local pick = require('mini.pick')
			-- pick.setup()
			-- vim.ui.select = pick.ui_select

			require("mini.test").setup({})

			require("mini.starter").setup({
				header = function()
					local hour = tonumber(vim.fn.strftime("%H"))
					-- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
					local part_id = math.floor((hour + 4) / 8) + 1
					local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
					local username = "Josh"

					return ("Good %s, %s"):format(day_part, username)
				end,
			})
		end,
	},
}
