vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

pcall(function()
	vim.treesitter.start()
	vim.wo[0][0].foldmethod = "expr"
	vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
end)
