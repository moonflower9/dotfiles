require("nvim-treesitter").setup()
require("nvim-treesitter").install({ "rust", "c", "lua" })

vim.api.nvim_create_autocmd('FileType', {
    pattern = { "rust", "c", "lua" },
    callback = function() vim.treesitter.start() end,
})
