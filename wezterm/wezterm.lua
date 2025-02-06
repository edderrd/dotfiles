local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_close_confirmation = "AlwaysPrompt"
config.use_dead_keys = false
config.font = wezterm.font("ComicCodeLigatures NF")
config.font_size = 13
config.line_height = 1.0
config.enable_tab_bar = false
config.underline_position = -7
config.underline_thickness = 2
config.front_end = "WebGpu"
config.term = "wezterm"
config.color_scheme = "Catppuccin Mocha"
config.window_decorations = "RESIZE | MACOS_FORCE_ENABLE_SHADOW"
-- config.window_decorations = " TITLE | RESIZE"
-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 20
config.window_padding = {
	left = 20,
	right = 20,
	bottom = 20,
	top = 20,
}

config.keys = {
	-- Make Option-Left and Option-Right not retarded on macOS. Now that key combo jumps word left or right
	--
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
	--
}

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "SUPER",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config
