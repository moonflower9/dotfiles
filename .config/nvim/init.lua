vim.opt.clipboard = "unnamedplus"

vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

vim.cmd.colorscheme("miniwinter")

require("mini.basics").setup()

require("mini.completion").setup()

require("mini.files").setup()
vim.keymap.set("n", "<leader>fm", ":lua MiniFiles.open()<cr>")

require("mini.icons").setup()

require("mini.pairs").setup()

require("mini.snippets").setup()

require("mini.surround").setup()

require("trouble").setup()
vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xq", ":Trouble qflist toggle<cr>")

require("lualine").setup()

require("gitsigns").setup()

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
