-- entry point
require("config")

vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/stevearc/conform.nvim",
})

vim.cmd.colorscheme("miniwinter")

require("mini.comment").setup()
require("mini.completion").setup()
require("mini.git").setup()
require("mini.icons").setup()
require("mini.indentscope").setup()
require("mini.move").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.snippets").setup()
require("mini.statusline").setup()
require("mini.surround").setup()
require("mini.diff").setup({ view = { style = "sign" } })
require("mini.files").setup()
require("trouble").setup()

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		h = { "clang-format" },
		hpp = { "clang-format" },
		rs = { "rustfmt" },
	},
	format_on_save = {
		timeout_ms = 750,
		lsp_format = "fallback",
	},
})
