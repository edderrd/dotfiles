-- vim.cmd([[
--   hi Pmenu ctermbg=NONE guibg=NONE
--   hi Pmenu ctermbg=NONE guibg=NONE
--   hi NormalFloat ctermbg=NONE guibg=NONE
-- ]])

local M = {
	style = "dark",
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
}

return M
