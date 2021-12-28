local wezterm = require 'wezterm'

return {
	font = wezterm.font("Iosevka Term SS08", {weight="Light"}),
	font_size = 16,
	color_scheme = "Gruvbox Dark",
        color_schemes = {
          ["Gruvbox Dark"] = {
            background = "#2b3339",
          }
        },
	hide_tab_bar_if_only_one_tab = true,
        window_padding = {
          left = 0,
          right = 0,
          top = 0,
          bottom = 0,
        },
	text_background_opacity = 0.86,
	window_background_opacity = 0.88,
	colors = {
 
		tab_bar = {
			background = "#3c3836",
			active_tab = {
				bg_color = "#665c54",
				fg_color = "#EDF5FD"
			},
			inactive_tab = {
				bg_color = "#504945",
				fg_color = "#928374"
			},
			inactive_tab_hover = {
				bg_color = "#665c54",
				fg_color = "#EDF5FD"
			},
			new_tab = {
				bg_color = "#504945",
				fg_color = "#928374"
			},
			new_tab_hover = {
				bg_color = "#665c54",
				fg_color = "#EDF5FD"
			},
		}
	}
}
