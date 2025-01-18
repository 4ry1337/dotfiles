local transparent = true
local terminal_colors = true

local M = {
	rose_pine = {},
	catppuccin = {},
	monokai_nightasty = {},
	modus_themes = {},
	tokyonight = {
		style = "moon", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
		light_style = "day", -- The theme is used when the background is set to light
		transparent = transparent, -- Enable this to disable setting the background color
		terminal_colors = terminal_colors, -- Configure the colors used when opening a `:terminal` in Neovim
	},
}

return M
