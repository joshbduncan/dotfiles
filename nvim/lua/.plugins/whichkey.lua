return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- document existing key chains
			spec = {
				mode = { "n", "v" },
				{ "<leader>b", group = "[B]uffers" },
				{ "<leader>c", group = "[C]ode" },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>e", group = "[E]ecute" },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>w", group = "[W]orkspace" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
