require("mini.comment").setup()
require("mini.diff").setup({ view = { style = "sign" } })
require("mini.git").setup()
require("mini.icons").setup()
require("mini.indentscope").setup()
require("mini.completion").setup()
require("mini.surround").setup()
require("mini.pick").setup()

vim.keymap.set("n", "<leader>vd", require("mini.diff").toggle_overlay, { desc = "Toggle diff" })

local statusline = require("mini.statusline")
local statusline_active = function()
    local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
    local git = statusline.section_git({ trunc_width = 75 })
    local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
    local lsp = statusline.section_lsp({ trunc_width = 75 })
    local filename = statusline.section_filename({ trunc_width = 140 })
    local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
    local location = statusline.section_location({ trunc_width = 75 })
    local search = statusline.section_searchcount({ trunc_width = 75 })

    return statusline.combine_groups({
        { hl = mode_hl,                 strings = { mode } },
        { hl = "MiniStatuslineDevinfo", strings = { git, diagnostics, lsp } },
        "%<",
        { hl = "MiniStatuslineFilename", strings = { filename } },
        "%=",
        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
        { hl = mode_hl,                  strings = { search, location } },
    })
end
statusline.setup({ content = { active = statusline_active } })

vim.keymap.set("n", "<leader>ff", require("mini.pick").builtin.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fb", require("mini.pick").builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fg", require("mini.pick").builtin.grep_live, { desc = "Live grep" })
