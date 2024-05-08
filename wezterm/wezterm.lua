local wezterm = require("wezterm")

return {
	font = wezterm.font("ComicCodeLigatures NFM"),
	font_size = 13,
	line_height = 1,
	enable_tab_bar = false,
	-- color_scheme = "OneDark (Gogh)",
	color_scheme = "Catppuccin Mocha",
	--[[ term = "wezterm", ]]
	-- window_decorations = " TITLE | RESIZE",
	window_decorations = "RESIZE",
	--[[ window_background_opacity = 0.9, ]]
	window_padding = {
		left = 8,
		right = 8,
		bottom = 8,
		top = 8,
	},
}
