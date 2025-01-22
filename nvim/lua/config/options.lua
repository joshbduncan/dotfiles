local opt = vim.opt

-- opt.breakindent = true -- keep things aligned
opt.clipboard = "unnamedplus" -- sync clipboard between os and neovim
opt.completeopt = "menu,menuone,noselect" -- opt completeopt to have a better completion experience
opt.confirm = true -- confirm to save changes before exiting
opt.cursorline = true -- show which line your cursor is on
opt.expandtab = true -- use spaces instead of tabs
opt.formatoptions = "jcroqlnt"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- case-insensitive searching unless \c or capital in search
opt.inccommand = "nosplit"
opt.jumpoptions = "view"
opt.mouse = "a" -- enable mouse mode, can be useful for resizing splits for example!
opt.number = true -- enable line numbers (relative)
opt.numberwidth = 4
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true
opt.scrolloff = 4 -- minimal number of screen lines to keep above and below the cursor
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 --  Size of an indent
opt.showmode = false -- don"t show the mode, since it"s already in the status line
opt.sidescrolloff = 8
opt.signcolumn = "yes" -- keep signcolumn on by default
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.smoothscroll = true
opt.spelllang = { "en" }
opt.softtabstop = 4
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 250 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.wrap = false

-- Add filetype detection for Jinja
vim.filetype.add({
	extension = {
		jinja = "jinja",
		jinja2 = "jinja",
		j2 = "jinja",
	},
})
