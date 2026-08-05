vim.diagnostic.config({ virtual_text = true, underline = true, severity_sort = true })

vim.keymap.set("n", "<leader>dn", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)

vim.keymap.set("n", "<leader>dN", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)

vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist)
