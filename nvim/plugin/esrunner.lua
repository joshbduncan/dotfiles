-- instead of calling vim.pack.add(), delveopment plugins are symlinked into
-- ~/.local/share/nvim/site/pack/dev (/start for autoload and /opt for not)
-- https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack#install-and-load

require("esrunner").setup({
	defaults = {
		["execute_on_single_matches"] = false,
	},
	apps = {
		["Adobe After Effects 2025"] = {
			path = "/Applications/Adobe After Effects 2025/Adobe After Effects 2025.app",
			version = "25.6.4",
		},
		["Adobe After Effects 2026"] = {
			path = "/Applications/Adobe After Effects 2026/Adobe After Effects 2026.app",
			version = "26.0.0",
		},
		["Adobe After Effects Render Engine 2025"] = {
			path = "/Applications/Adobe After Effects 2025/Adobe After Effects Render Engine 2025.app",
			version = "25.6.4",
		},
		["Adobe After Effects Render Engine 2026"] = {
			path = "/Applications/Adobe After Effects 2026/Adobe After Effects Render Engine 2026.app",
			version = "26.0.0",
		},
		["Adobe Illustrator 2026"] = {
			path = "/Applications/Adobe Illustrator 2026/Adobe Illustrator.app",
			version = "30.3.0",
		},
		["Adobe InDesign 2026"] = {
			path = "/Applications/Adobe InDesign 2026/Adobe InDesign 2026.app",
			version = "21.3.0.60",
		},
		["Adobe Photoshop 2026"] = {
			path = "/Applications/Adobe Photoshop 2026/Adobe Photoshop 2026.app",
			version = "27.5.0",
		},
	},
})
