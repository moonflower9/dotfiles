vim.cmd.colorscheme("monoorange")

require("mini.comment").setup()
require("mini.icons").setup()
require("mini.pick").setup()
require("mini.surround").setup()
require("mini.statusline").setup()

vim.keymap.set("n", "<leader>ff", require("mini.pick").builtin.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fb", require("mini.pick").builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fg", require("mini.pick").builtin.grep_live, { desc = "Live grep" })
