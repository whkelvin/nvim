local theme = require("colors/theme")

local bufferline = {}

function bufferline.get_highlights()
	return {
		fill = {
			bg = theme.base16.base00,
		},
		background = {
			bg = theme.base16.base00,
		},
		tab = {
			bg = theme.base16.base00,
		},
		tab_selected = {
			bg = theme.base16.base00,
		},
		tab_close = {
			bg = theme.base16.base00,
		},
		close_button = {
			bg = theme.base16.base00,
		},
		close_button_visible = {
			bg = theme.base16.base00,
		},
		close_button_selected = {
			bg = theme.base16.base00,
		},
		buffer_visible = {
			bg = theme.base16.base00,
		},
		buffer_selected = {
			bg = theme.base16.base00,
		},
		numbers = {
			bg = theme.base16.base00,
		},
		numbers_visible = {
			bg = theme.base16.base00,
		},
		numbers_selected = {
			bg = theme.base16.base00,
		},
		diagnostic = {
			bg = theme.base16.base00,
		},
		diagnostic_visible = {
			bg = theme.base16.base00,
		},
		diagnostic_selected = {
			bg = theme.base16.base00,
		},
		hint = {
			bg = theme.base16.base00,
		},
		hint_visible = {
			bg = theme.base16.base00,
		},
		hint_selected = {
			bg = theme.base16.base00,
		},
		hint_diagnostic = {
			bg = theme.base16.base00,
		},
		hint_diagnostic_visible = {
			bg = theme.base16.base00,
		},
		hint_diagnostic_selected = {
			bg = theme.base16.base00,
		},
		info = {
			bg = theme.base16.base00,
		},
		info_visible = {
			bg = theme.base16.base00,
		},
		info_selected = {
			bg = theme.base16.base00,
		},
		info_diagnostic = {
			bg = theme.base16.base00,
		},
		info_diagnostic_visible = {
			bg = theme.base16.base00,
		},
		info_diagnostic_selected = {
			bg = theme.base16.base00,
		},
		warning = {
			bg = theme.base16.base00,
		},
		warning_visible = {
			bg = theme.base16.base00,
		},
		warning_selected = {
			bg = theme.base16.base00,
		},
		warning_diagnostic = {
			bg = theme.base16.base00,
		},
		warning_diagnostic_visible = {
			bg = theme.base16.base00,
		},
		warning_diagnostic_selected = {
			bg = theme.base16.base00,
		},
		error = {
			bg = theme.base16.base00,
		},
		error_visible = {
			bg = theme.base16.base00,
		},
		error_selected = {
			bg = theme.base16.base00,
		},
		error_diagnostic = {
			bg = theme.base16.base00,
		},
		error_diagnostic_visible = {
			bg = theme.base16.base00,
		},
		error_diagnostic_selected = {
			bg = theme.base16.base00,
		},
		modified = {
			bg = theme.base16.base00,
		},
		modified_visible = {
			bg = theme.base16.base00,
		},
		modified_selected = {
			bg = theme.base16.base00,
		},
		duplicate_selected = {
			bg = theme.base16.base00,
		},
		duplicate_visible = {
			bg = theme.base16.base00,
		},
		duplicate = {
			bg = theme.base16.base00,
		},
		separator_selected = {
			fg = theme.colors.nord_blue,
			bg = theme.base16.base00,
		},
		separator_visible = {
			fg = theme.base16.base00,
			bg = theme.base16.base00,
		},
		separator = {
			fg = theme.base16.base00,
			bg = theme.base16.base00,
		},
		indicator_selected = {
			bg = theme.base16.base00,
			fg = theme.base16.base00,
		},
		pick_selected = {
			bg = theme.base16.base00,
		},
		pick_visible = {
			bg = theme.base16.base00,
		},
		pick = {
			bg = theme.base16.base00,
		},
		offset_separator = {
			bg = theme.colors.darker_black,
			fg = theme.colors.darker_black,
		},
	}
end

return bufferline
