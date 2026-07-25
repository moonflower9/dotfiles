require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		c = { "clang-format" },
	},
	format_on_save = {
		timeout_ms = 750,
		lsp_format = "fallback",
	},
})
