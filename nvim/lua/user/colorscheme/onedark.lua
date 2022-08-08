-- vim.cmd([[
--   hi Pmenu ctermbg=NONE guibg=NONE
--   hi Pmenu ctermbg=NONE guibg=NONE
--   hi NormalFloat ctermbg=NONE guibg=NONE
-- ]])

local M = {
	style = "warm",
	code_style = {
		comments = "italic",
		keywords = "italic",
		functions = "italic,bold",
		strings = "italic",
		variables = "NONE",
	},
	diagnostic = {
		undercurl = true,
	},
	colors = {
		bg0 = "#1D1F21",
	},
}

return M
