vim.lsp.enable({ "lua_ls", "rust_analyzer", "clangd" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(event)
		local bufnr = event.buf
		local map = function(keys, fn, desc)
			vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = "LSP: " .. desc })
		end

		map("gd", vim.lsp.buf.definition, "Goto Definition")
		map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		map("gi", vim.lsp.buf.implementation, "Goto Implementation")
		map("gr", vim.lsp.buf.references, "References")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("<leader>rn", vim.lsp.buf.rename, "Rename")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
		map("<leader>fmt", function()
			require("conform").format({ async = true, lsp_format = "fallback" })
		end, "Format")

		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end,
})
