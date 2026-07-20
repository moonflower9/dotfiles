local opt = vim.opt

vim.g.mapleader = " "
opt.termguicolors = true
vim.cmd.colorscheme("habamax")

-- line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 10
opt.sidescrolloff = 8

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = false
opt.autoindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- visuals
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmatch = true
opt.cmdheight = 0
opt.showmode = false
opt.pumheight = 20
opt.synmaxcol = 300
opt.foldlevelstart = 99

-- file handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.updatetime = 300

-- clipboard :)
opt.clipboard = "unnamedplus"
