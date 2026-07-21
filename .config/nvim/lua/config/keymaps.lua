vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "<leader>qf", vim.diagnostic.setqflist, { desc = "Send Diagnostics to Quickfix" })
