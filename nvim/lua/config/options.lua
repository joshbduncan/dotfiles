-- vim.opt.breakindent = true -- keep things aligned
vim.opt.clipboard = "unnamedplus" -- sync clipboard between os and neovim
vim.opt.completeopt = "menu,menuone,noselect" -- opt completeopt to have a better completion experience
vim.opt.confirm = true -- confirm to save changes before exiting
vim.opt.cursorline = true -- show which line your cursor is on
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true -- case-insensitive searching unless \c or capital in search
vim.opt.inccommand = "nosplit"
vim.opt.jumpoptions = "view"
vim.opt.mouse = "a" -- enable mouse mode, can be useful for resizing splits for example!
vim.opt.number = true -- enable line numbers (relative)
vim.opt.numberwidth = 4
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true
vim.opt.scrolloff = 4 -- minimal number of screen lines to keep above and below the cursor
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 4 --  Size of an indent
vim.opt.showmode = false -- don"t show the mode, since it"s already in the status line
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes" -- keep signcolumn on by default
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.smoothscroll = true
vim.opt.spelllang = { "en" }
vim.opt.softtabstop = 4
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 250 -- Save swap file and trigger CursorHold
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winborder = "rounded"
vim.opt.wrap = false

-- Add filetype detection for Jinja
vim.filetype.add({
	extension = {
		jinja = "jinja",
		jinja2 = "jinja",
		j2 = "jinja",
	},
})
