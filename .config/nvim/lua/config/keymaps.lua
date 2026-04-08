local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- buffer switching
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

-- plugin keybinds
map("n", "<leader>vd", "<cmd>lua MiniDiff.toggle_overlay()<cr>", { desc = "toggle diff view" })
map("n", "<leader>fm", "<cmd>lua MiniFiles.open()<cr>", { desc = "file manager" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>")
