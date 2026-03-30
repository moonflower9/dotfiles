vim.opt.clipboard = "unnamedplus"

vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvim-mini/mini.nvim",
})

vim.cmd.colorscheme("minicyan")
require("mini.basics").setup()
require("mini.completion").setup()
require("mini.files").setup()
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.snippets").setup()
require("mini.surround").setup()

require("lualine").setup()

require("conform").setup({
	formatters_by_ft = {
		lua = { "lua_ls" },
		c = { "clangd" },
		cpp = { "clangd" },
		h = { "clangd" },
		hpp = { "clangd" },
		rs = { "rust_analyzer" },
	},
	format_on_save = {
		timeout_ms = 750,
		lsp_format = "fallback",
	},
})

vim.lsp.enable({ "lua_ls", "clangd", "rust_analyzer" })
