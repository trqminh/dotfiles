local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Fixedsys Excelsior")
config.font_size = 18
config.color_scheme = "Flexoki Light"

config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

return config
