local wezterm = require("wezterm")

return {
  font = wezterm.font("ComicCodeLigatures Nerd Font"),
  font_size = 13,
  line_height = 1.6,
  enable_tab_bar = false,
  color_scheme = "OneDark (Gogh)",
  --[[ term = "wezterm", ]]
  window_decorations = " TITLE | RESIZE",
  --[[ window_background_opacity = 0.9, ]]
  window_padding = {
    left = 2,
    right = 2,
    bottom = 2,
    top = 2,
  },
}
