local colors = require("user.colorscheme.theme.onedark")

local M = {
	style = "warm",
	transparent = false,
	code_style = {
		comments = "italic",
		keywords = "italic",
		functions = "italic,bold",
		strings = "italic",
		variables = "NONE",
	},
	diagnostic = {
		undercurl = true,
		darker = true,
	},
	colors = {
		bg0 = "#1D1F21",
	},
	highlights = {
		NormalFloat = { bg = "NONE" },
		FloatBorder = { bg = "NONE", fg = "$grey" },
		TabLineSel = {
			bg = colors.blue,
		},
	},
}

return M
