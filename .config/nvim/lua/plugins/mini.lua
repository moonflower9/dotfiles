local map = vim.keymap.set

vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.comment").setup()
require("mini.completion").setup()
require("mini.diff").setup({ view = { style = "sign" } })
map("n", "<leader>vd", MiniDiff.toggle_overlay, { desc = "Toggle diff" })
require("mini.files").setup()
map("n", "<leader>fm", MiniFiles.open, { desc = "Open file manager" })
require("mini.git").setup()
require("mini.icons").setup()
require("mini.indentscope").setup()
require("mini.move").setup()
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.snippets").setup()
require("mini.statusline").setup()
require("mini.surround").setup()
