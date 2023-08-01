local colors = require("colors/theme")
local line_ok, feline = pcall(require, "feline")
if not line_ok then
	return
end

local nord = {
	fg = colors.fg,
	bg = colors.bg2,
	green = colors.green,
	yellow = colors.yellow,
	purple = colors.violet,
	orange = colors.orange,
	peanut = colors.yellow,
	red = colors.red,
	aqua = colors.blue,
	darkblue = colors.bg1,
	dark_red = colors.red,
}

local vi_mode_colors = {
	NORMAL = colors.green,
	OP = colors.green,
	INSERT = colors.yellow,
	VISUAL = colors.violet,
	LINES = colors.orange,
	BLOCK = colors.red,
	REPLACE = colors.red,
	COMMAND = colors.teal,
}

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
				-- padding = "center", -- Uncomment for extra padding.
			},
		},
		hl = function()
			return {
				fg = require("feline.providers.vi_mode").get_mode_color(),
				bg = colors.bg2,
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = colors.yellow,
			bg = colors.bg2,
			style = "bold",
		},
		left_sep = "block",
		right_sep = "right_filled",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "red",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "fg",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "right_filled",
	},
	separator = {
		provider = "",
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative-short",
			},
		},
		hl = {
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = colors.red,
		},
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = colors.yellow,
		},
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = colors.violet,
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = colors.fg,
			bg = colors.bg2,
			style = "bold",
		},
		left_sep = "left_filled",
		right_sep = "block",
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "titlecase",
			},
		},
		hl = {
			fg = colors.fg,
			bg = colors.bg2,
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = "orange",
			bg = "darkblue",
			style = "italic",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = "position",
		hl = {
			fg = "green",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = "aqua",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = {
			fg = "yellow",
			style = "bold",
		},
	},
}

local left = {
	c.vim_mode,
	c.gitBranch,
	--c.gitDiffAdded,
	--c.gitDiffRemoved,
	--c.gitDiffChanged,
	c.separator,
}

local middle = {
	-- c.fileinfo,
}

local right = {
	c.diagnostic_errors,
	c.diagnostic_warnings,
	c.diagnostic_info,
	c.diagnostic_hints,
	c.lsp_client_names,
	c.file_type,
	-- c.file_encoding,
	-- c.position,
	-- c.line_percentage,
	-- c.scroll_bar,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

feline.setup({
	components = components,
	theme = nord,
	vi_mode_colors = vi_mode_colors,
})
-- WINBAR
local winbar_components = {
	active = { {} },
}

winbar_components.active[1][1] = {
	provider = {
		name = "file_info",
		opts = {
			type = "full-path",
		},
	},
	hl = {
		fg = colors.fg,
		bg = colors.bg2,
		style = "bold",
	},
}

feline.winbar.setup({
	components = winbar_components,
	force_inactive = {
		filetypes = {
			"startup",
		},
	},
})
