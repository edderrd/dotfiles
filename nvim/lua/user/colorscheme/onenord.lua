local colors = require("onenord.colors").load()

vim.cmd([[highlight NormalFloat guibg=NONE]])
vim.cmd([[highlight FloatBorder guibg=NONE]])
vim.cmd([[highlight Pmenu guibg=NONE]])

local M = {
	borders = true,
	fade_nc = false,
	styles = {
		diagnostics = "undercurl",
		comments = "italic",
		keywords = "italic",
		functions = "italic,bold",
		strings = "italic",
	},
	custom_highlights = {
		TelescopeSelection = { bg = colors.gray, fg = colors.fg_light },
		BufferLineFill = { bg = "#191C23" },
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
