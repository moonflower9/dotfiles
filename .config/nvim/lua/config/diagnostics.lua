local sev = vim.diagnostic.severity

vim.diagnostic.config({
	-- keep underline & severity_sort on for quick scanning
	underline = true,
	severity_sort = true,
	signs = {
		text = {
			[sev.ERROR] = "",
			[sev.WARN] = "",
			[sev.INFO] = "",
			[sev.HINT] = "󰌵 ",
		},
	},
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "󰜥",
	},
	linehl = {
		[sev.ERROR] = "DiagnosticErrorLine",
		[sev.WARN] = "DiagnosticWarnLine",
		[sev.INFO] = "DiagnosticInfoLine",
		[sev.HINT] = "DiagnosticHintLine",
	},
})
