-- options
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.timeoutlen = 500
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"

vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/neovim/nvim-lspconfig",
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
vim.keymap.set("n", "<leader>vd", MiniDiff.toggle_overlay, { desc = "toggle diff view" })

require("mini.files").setup()
vim.keymap.set("n", "<leader>fm", MiniFiles.open, { desc = "file manager" })

require("trouble").setup()
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>")

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

vim.lsp.enable({ "lua_ls", "clangd", "rust_analyzer" })
