require("nvim-treesitter").setup()
require("nvim-treesitter").install({ "rust", "c", "lua", "bash", "zsh" }):wait(3000)

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "rust", "c", "lua", "sh", "bash", "zsh" },
	callback = function()
		vim.treesitter.start()
	end,
})
