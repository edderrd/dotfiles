local wezterm = require("wezterm")

return {
	font = wezterm.font("ComicCodeLigatures Nerd Font"),
	font_size = 14,
	line_height = 1.6,
	enable_tab_bar = false,
	color_scheme = "nord",
	term = "wezterm",
	window_decorations = " TITLE | RESIZE",
	-- window_background_opacity = 0.9,
	window_padding = {
		left = 8,
		right = 8,
		bottom = 8,
		top = 8,
	},
}
