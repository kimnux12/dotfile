local wezterm = require("wezterm")

return {

	window_decorations = "RESIZE",
	color_scheme = "Hardcore",
	font = wezterm.font_with_fallback({
		"JetBrains Mono",
		{ family = "Symbos Nerd Font Mono", scale = 0.7},
	}),
	use_cap_height_to_scale_fallback_fonts = true,
	font_size = 14,
	scrollback_lines = 5000,
	hide_tab_bar_if_only_one_tab = true,
}
