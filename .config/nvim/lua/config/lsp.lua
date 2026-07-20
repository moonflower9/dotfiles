vim.lsp.enable({ "lua_ls", "rust_analyzer", "clangd" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "lua", "rust" },
	callback = function()
		vim.treesitter.start()
	end,
})
