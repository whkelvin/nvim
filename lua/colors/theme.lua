local theme = {}
-- number is layer
--theme.glass = "#7c869c"
theme.glass = "#4c566a"
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
theme.cyan = "#88c0d0"

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

theme.undercurl = function(group, color)
  cmd("hi " .. group .. " gui=undercurl " .. "guisp=" .. color)
end

return theme
