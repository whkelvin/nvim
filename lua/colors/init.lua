local t = require("colors/theme")

local fg = t.highlight_fg
local bg = t.highlight_bg
local fg_bg = t.highlight_fg_bg

bg("Cursor", t.cursor)
bg("CursorLine", t.bg2)

-- Text Selection
bg("Visual", t.glass)

fg("Comment", t.fgSubtle)
fg("EndOfBuffer", t.bg)
fg("SpecialKey", t.bg)
fg("NonText", t.bg)

-- Hover Window
fg_bg("FloatBorder", t.bg1, t.bg1)
bg("NormalFloat", t.bg1)

bg("SignColumn", t.bg)
fg("LineNr", t.fgSubtle)
fg("Cursorlinenr", t.blue)

fg("VertSplit", t.bg2)
fg_bg("GitSignsAdd", t.green, "NONE")

fg_bg("GitSignsChange", t.yellow, "NONE")
fg_bg("GitSignsDelete", t.red, "NONE")

fg("IndentBlanklineChar", t.fg)
fg("IndentBlanklineSpaceChar", t.fg)

fg("DiagnosticHint", t.violet)
fg("DiagnosticError", t.red)
fg("DiagnosticWarn", t.yellow)
fg("DiagnosticInformation", t.green)

local nvimTreeBg = t.bg1
fg_bg("NvimTreeRootFolder", t.yellow, nvimTreeBg)
fg("NvimTreeOpenedFolderName", t.blue)
fg("NvimTreeEmptyFolderName", t.blue)
fg("NvimTreeFolderIcon", t.blue)
fg("NvimTreeFolderName", t.blue)
fg_bg("NvimTreeIndentMarker", t.blue, nvimTreeBg)
fg_bg("NvimTreeVertSplit", nvimTreeBg, nvimTreeBg)
fg_bg("NvimTreeWindowPicker", t.blue, nvimTreeBg)
fg_bg("NvimTreeNormal", t.fg, nvimTreeBg)
fg_bg("NvimTreeEndOfBuffer", nvimTreeBg, nvimTreeBg)
fg("NvimTreeGitDirty", t.red)
fg_bg("NvimTreeLineNr", nvimTreeBg, nvimTreeBg)

bg("TelescopeSelection", t.glass)
fg_bg("TelescopeBorder", t.bg, t.bg1)
fg_bg("TelescopeNormal", t.fg1, t.bg1)

fg_bg("TelescopePromptTitle", t.bg, t.teal)
fg_bg("TelescopePromptCounter", t.teal, t.bg2)
fg_bg("TelescopePromptNormal", t.fg1, t.bg2)
fg_bg("TelescopePromptPrefix", t.teal, t.bg2)
fg_bg("TelescopePromptBorder", t.bg2, t.bg2)

fg_bg("TelescopeResultsTitle", t.bg1, t.bg1)
bg("TelescopeResultsNormal", t.bg1)
fg_bg("TelescopeResultsBorder", t.bg1, t.bg1)
fg_bg("TelescopeResultsTitle", t.bg1, t.bg1)

fg_bg("TelescopePreviewTitle", t.bg1, t.blue)
fg_bg("TelescopePreviewBorder", t.bg1, t.bg1)
bg("TelescopePreviewNormal", t.bg1)

fg("HopNextKey", t.blue)
fg("HopNextKey1", t.blue)
fg("HopNextKey2", t.blue)

require("colors/highlights/syntax")
require("colors/highlights/cmp")
require("colors/highlights/indent-blank-line")
require("colors/highlights/misc")
require("colors/highlights/devicons")
require("colors/highlights/bufferline")
require("colors/highlights/winbar")
