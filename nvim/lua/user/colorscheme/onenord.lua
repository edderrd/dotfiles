local colors = require("onenord.colors").load()

local M = {
	borders = true,
	fade_nc = true,
	styles = {
		diagnostics = "undercurl",
		comments = "italic",
		keywords = "italic",
		functions = "italic,bold",
		strings = "italic",
	},
	custom_highlights = {
		TelescopeSelection = { bg = colors.gray, fg = colors.fg_light },
	},
	custom_colors = {
		-- bg = "#282c34",
	},
	disable = {
		background = false,
		eob_lines = true,
	},
}

return M
