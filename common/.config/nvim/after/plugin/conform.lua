require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		bash = { "shfmt" },
		sh = { "shfmt" },
		zsh = { "shfmt" },
		json = { "prettier" },
		jsonc = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 750,
		lsp_format = "fallback",
	},
})
