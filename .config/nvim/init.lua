vim.opt.clipboard = "unnamedplus"

vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

require("mini.basics").setup()

require("mini.hues").setup({
	background = "#0f1416",
	foreground = "#d0d4d5",
	saturation = "lowmedium",
})

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

require("lualine").setup({
	options = {
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_a = {
			{
				"branch",
				icon = "",
				color = { gui = "bold" },
			},
		},
		lualine_b = {
			{
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
				diff_color = {
					added = { fg = "#98c379" },
					modified = { fg = "#e5c07b" },
					removed = { fg = "#e06c75" },
				},
			},
		},
		lualine_c = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
			},
		},
		lualine_x = { "location" },
		lualine_y = { "encoding" },
		lualine_z = { "filetype" },
	},
	inactive_sections = {
		-- remove defaults
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
})

require("gitsigns").setup()

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
