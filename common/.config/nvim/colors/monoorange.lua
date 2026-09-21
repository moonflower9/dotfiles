local orange = "#ff8800"

local palette = {
	base00 = "#1a1a1a", -- bg (set to "NONE" for transparent terminal bg)
	base01 = "#262626",
	base02 = "#3a3a3a",
	base03 = "#5a5a5a", -- comments, line numbers
	base04 = "#9a9a9a",
	base05 = "#c5c5c5", -- default fg
	base06 = "#e0e0e0",
	base07 = "#ffffff",
	base08 = "#c5c5c5", -- variables      (monochrome)
	base09 = "#c5c5c5", -- constants      (monochrome)
	base0A = orange, -- types/classes  (orange)
	base0B = "#c5c5c5", -- strings        (monochrome)
	base0C = "#c5c5c5", -- operators      (monochrome)
	base0D = orange, -- functions      (orange)
	base0E = orange, -- keywords       (orange)
	base0F = "#5a5a5a", -- deprecated     (dim, italic via override)
}

require("mini.base16").setup({ palette = palette, use_cterm = true })
vim.g.colors_name = "monoorange"
