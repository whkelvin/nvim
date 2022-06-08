local cmd = vim.cmd

-- Define bg color
-- @param group Group
-- @param color Color
bg = function(group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
fg = function(group, col)
   cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
fg_bg = function(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

local colors = {
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
   teal = "#6484a4",
   orange = "#e39a83",
   cyan = "#9aafe6",
   statusline_bg = "#333945",
   lightbg = "#3f4551",
   lightbg2 = "#393f4b",
   pmenu_bg = "#A3BE8C",
   folder_bg = "#7797b7",
}

local black = colors.black
local black2 = colors.black2
local blue = colors.blue
local darker_black = colors.darker_black
local folder_bg = colors.folder_bg
local green = colors.green
local grey = colors.grey
local grey_fg = colors.grey_fg
local light_grey = colors.light_grey
local line = colors.line
local nord_blue = colors.nord_blue
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local pmenu_bg = colors.pmenu_bg
local purple = colors.purple
local red = colors.red
local white = colors.white
local yellow = colors.yellow
local orange = colors.orange
local one_bg3 = colors.one_bg3

-- Comments
fg("Comment", grey_fg)

-- Disable cursor line
cmd "hi clear CursorLine"
-- Line number
fg("cursorlinenr", white)

-- same it bg, so it doesn't appear
fg("EndOfBuffer", black)

-- For floating windows
fg("FloatBorder", blue)
bg("NormalFloat", darker_black)

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", pmenu_bg)
bg("PmenuThumb", nord_blue)
fg("CmpItemAbbr", white)
fg("CmpItemAbbrMatch", white)
fg("CmpItemKind", white)
fg("CmpItemMenu", white)

-- misc

-- inactive statuslines as thin lines
fg("StatusLineNC", one_bg3 .. " gui=underline")

fg("LineNr", grey)
fg("NvimInternalError", red)
fg("VertSplit", one_bg2)

-- Git signs
--fg_bg("DiffAdd", green, "NONE")
--fg_bg("DiffChange", yellow, "NONE")
--fg_bg("DiffChangeDelete", red, "NONE")
--fg_bg("DiffModified", red, "NONE")
--fg_bg("DiffDelete", red, "NONE")

fg_bg('GitSignsAdd', green, "NONE")
fg_bg('GitSignsChange', yellow, "NONE")
fg_bg('GitSignsDelete', red, "NONE")

-- Indent blankline plugin
fg("IndentBlanklineChar", line)
fg("IndentBlanklineSpaceChar", line)

-- Lsp diagnostics

fg("DiagnosticHint", purple)
fg("DiagnosticError", red)
fg("DiagnosticWarn", yellow)
fg("DiagnosticInformation", green)

-- NvimTree
fg("NvimTreeEmptyFolderName", folder_bg)
fg("NvimTreeEndOfBuffer", darker_black)
fg("NvimTreeFolderIcon", folder_bg)
fg("NvimTreeFolderName", folder_bg)
fg("NvimTreeGitDirty", red)
fg("NvimTreeIndentMarker", one_bg2)
bg("NvimTreeNormal", darker_black)
bg("NvimTreeNormalNC", darker_black)
fg("NvimTreeOpenedFolderName", folder_bg)
fg("NvimTreeRootFolder", yellow .. " gui=underline") -- enable underline for root folder in nvim tree
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg_bg("NvimTreeVertSplit", darker_black, darker_black)
fg_bg("NvimTreeWindowPicker", red, black2)

-- Telescope
fg_bg("TelescopeBorder", darker_black, darker_black)
fg_bg("TelescopePromptBorder", black2, black2)

fg_bg("TelescopePromptNormal", white, black2)
fg_bg("TelescopePromptPrefix", yellow, black2)

bg("TelescopeNormal", darker_black)

fg_bg("TelescopePreviewTitle", black, nord_blue)
fg_bg("TelescopePromptTitle", black, yellow)
fg_bg("TelescopeResultsTitle", darker_black, darker_black)

bg("TelescopeSelection", black2)

fg("HopNextKey", yellow)
fg("HopNextKey1", yellow)
fg("HopNextKey2", blue)
