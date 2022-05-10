local M = {
	transparent_background = false,
	term_colors = false,
	styles = {
		comments = "italic",
		functions = "NONE",
		keywords = "bold",
		strings = "NONE",
		variables = "NONE",
	},
	integrations = {
		native_lsp = {
			enabled = true,
			underlines = {
				errors = "undercurl",
				hints = "undercurl",
				warnings = "undercurl",
				information = "undercurl",
			},
		},
		nvimtree = {
			enabled = true,
			show_root = false,
			transparent_panel = true,
		},

		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
	},
}

return M
