
local wezterm = require 'wezterm'

return {
	  font = wezterm.font("Iosevka"),
    font_size = 18,
    color_scheme = "Gruvbox Dark",
		hide_tab_bar_if_only_one_tab = true,
		text_background_opacity = 1.0,
		window_background_image = "/home/rishi/.config/wezterm/wall.jpg",
		window_background_image_hsb = {
			brightness = 0.38,
			hue = 1.0,
			saturation = 0.6
		},
		keys = {
			{ key="[", mods="SUPER", action=wezterm.action{ActivateTabRelative=-1} },
			{ key="]", mods="SUPER", action=wezterm.action{ActivateTabRelative=1} }
		}
	}
