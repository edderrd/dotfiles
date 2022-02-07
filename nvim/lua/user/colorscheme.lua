local colorscheme = "catppuccin"

-- import lua module for setup
local status_ok_scheme, scheme = pcall(require, colorscheme)
if not status_ok_scheme then
	vim.notify("theme " .. colorscheme .. "not loaded")
	return
end

-- module setup config
scheme.setup({
	transparent_background = true,
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
})

-- load module in vim
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

vim.cmd([[
  hi Pmenu ctermbg=NONE guibg=NONE
  hi Pmenu ctermbg=NONE guibg=NONE
  hi NormalFloat ctermbg=NONE guibg=NONE
]])
