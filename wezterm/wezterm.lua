local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

config.term = "xterm-256color"

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

config.window_close_confirmation = "AlwaysPrompt"
config.use_dead_keys = false
config.font = wezterm.font("ComicCodeLigatures NF")
config.font_size = 14
config.line_height = 1.2
-- config.enable_tab_bar = false
config.underline_position = -6
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

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(key)
	return {
		key = key,
		mods = "CTRL",
		action = wezterm.action_callback(function(win, pane)
			-- if pane:Get_users_vars().IS_NVIM == "true" then
			-- 	-- pass the keys through to vim/nvim
			-- 	win:perform_action({
			-- 		SendKey = { key = key, mods = "CTRL" },
			-- 	}, pane)
			-- else
			-- 	win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
			-- end

			win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
		end),
	}
end

config.keys = {
	-- Make Option-Left and Option-Right not retarded on macOS. Now that key combo jumps word left or right
	--
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x2bf" }) },
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	split_nav("h"),
	split_nav("j"),
	split_nav("k"),
	split_nav("l"),
	{
		key = "z",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "p",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(1),
	},

	{ key = "[", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "SUPER",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = tab_title(tab)
	local zoomed = ""

	if tab.is_active then
		return {
			{ Background = { Color = "blue" } },
			{ Text = " " .. title .. " " },
		}
	end

	if tab.is_zoomed then
		zoomed = "[Z] "
	end

	if tab.is_last_active then
		-- Green color and append '*' to previously active tab.
		return {
			{ Background = { Color = "green" } },
			{ Text = " " .. title .. "*" },
		}
	end
	return zoomed .. title
end)

config.ssh_domains = {
	{
		name = "tarro",
		remote_address = "tarro",
		username = "edder",
	},
}

return config
