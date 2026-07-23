vim.g.mapleader = " "
vim.opt.termguicolors = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = false
vim.opt.autoindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- visuals
vim.opt.termguicolors = true
vim.cmd.colorscheme("habamax")
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.pumheight = 20
vim.opt.synmaxcol = 300
vim.opt.foldlevelstart = 99

-- file handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.updatetime = 300

-- clipboard :)
vim.opt.clipboard = "unnamedplus"
