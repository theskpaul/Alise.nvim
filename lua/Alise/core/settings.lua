vim.cmd("let g:netrw_liststyle = 3")
vim.diagnostic.config({
	virtual_text = false,
})

local opt = vim.opt

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.expandtab = true
opt.autoindent = true
opt.softtabstop = 4

-- Text Editing & Editor
opt.relativenumber = true
opt.number = true
opt.cursorline = true
opt.backspace = "indent,eol,start"

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Colors & Themeing
opt.termguicolors = true
opt.signcolumn = "yes"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Window Split
opt.splitright = true
