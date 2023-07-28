local theme = {}

-- number is layer
theme.glass = "#7c869c"
theme.cursor = "#a9afbc"
theme.bg = "#3b4252"
theme.bg1 = "#2e3440"
theme.bg2 = "#434c5e"
theme.bg3 = "#4c566a"

theme.fg = "#d8dee9"
theme.fg1 = "#d8dee9"
theme.fg2 = "#d8dee9"
theme.fg3 = "#d8dee9"

theme.fgSubtle = "#556077"
theme.fgSubtle1 = "#4b5468"
theme.fgSubtle2 = "#606C86"
theme.fgSubtle3 = "#6A7895"

theme.red = "#bf616a"
theme.orange = "#d08770"
theme.yellow = "#ebcb8b"
theme.green = "#a3be8c"
theme.blue = "#81a1c1"
theme.indigo = "#5e81ac"
theme.violet = "#b48ead"
theme.teal = "#8fbcbb"

theme.colors = {
	white = "#abb2bf",
	darker_black = "#2a303c",
	black = "#2E3440", --  nvim bg
	black2 = "#343a46",
	one_bg = "#373d49",
	one_bg2 = "#464c58",
	one_bg3 = "#494f5b",
	grey = "#4b515d",
	grey_fg = "#565c68",
	grey_fg2 = "#606672",
	light_grey = "#646a76",
	red = "#BF616A",
	baby_pink = "#de878f",
	pink = "#d57780",
	line = "#3a404c", -- for lines like vertsplit
	green = "#A3BE8C",
	vibrant_green = "#afca98",
	blue = "#7797b7",
	nord_blue = "#81A1C1",
	yellow = "#EBCB8B",
	sun = "#e1c181",
	purple = "#aab1be",
	dark_purple = "#B48EAD",
	teal = "#8fbcbb",
	orange = "#d08770",
	cyan = "#9aafe6",
	statusline_bg = "#333945",
	lightbg = "#3f4551",
	lightbg2 = "#393f4b",
	pmenu_bg = "#A3BE8C",
	folder_bg = "#7797b7",
}

theme.base16 = {
	base00 = "#3b4252",
	base01 = "#3B4252",
	base02 = "#434C5E",
	base03 = "#4C566A",
	base04 = "#D8DEE9",
	base05 = "#E5E9F0",
	base06 = "#ECEFF4",
	base07 = "#8FBCBB",
	base08 = "#88C0D0",
	base09 = "#81A1C1",
	base0A = "#5e81ac",
	base0B = "#A3BE8C",
	base0C = "#81A1C1",
	base0D = "#EBCB8B",
	base0E = "#e39a83",
	base0F = "#B48EAD",
}

local cmd = vim.cmd

-- Define bg color
-- @param group Group
-- @param color Color
theme.highlight_bg = function(group, col)
	cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
theme.highlight_fg = function(group, col)
	cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
theme.highlight_fg_bg = function(group, fgcol, bgcol)
	cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

theme.highlight_gui = function(group, guiopt)
	cmd("hi " .. group .. " gui=" .. guiopt)
end

return theme
