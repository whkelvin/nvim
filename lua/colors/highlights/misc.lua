local t = require("colors/theme")
local fg = t.highlight_fg
local bg = t.highlight_bg
local fg_bg = t.highlight_fg_bg
local undercurl = t.undercurl

bg("Normal", t.bg)
bg("MsgArea", t.bg)

bg("WinBar", t.bg)
bg("WinBarNC", t.bg)

bg("Cursor", t.cursor)
bg("lCursor", t.cursor)
bg("CursorLine", t.bg2)

-- Text Selection
bg("Visual", t.glass)

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


fg("HopNextKey", t.blue)
fg("HopNextKey1", t.blue)
fg("HopNextKey2", t.blue)

fg_bg("MatchParen", t.bg, t.blue)
fg_bg("Search", t.blue, t.glass)
fg_bg("Substitute", t.bg, t.blue)
fg_bg("IncSearch", t.bg, t.blue)
fg_bg("CurSearch", t.bg, t.blue)


fg_bg("QuickFixLine", t.fg, t.bg)
fg_bg("QuickFixStatusLine", t.fg, t.bg)
fg("DiagnosticHint", t.violet)
fg("DiagnosticError", t.red)
fg("DiagnosticWarn", t.yellow)
fg("DiagnosticInformation", t.green)
fg("DiagnosticUnnecessary", t.orange)
fg("DiagnosticUnderlineError", t.red)
fg("DiagnosticUnderlineWarn", t.orange)
fg("DiagnosticUnderlineInfo", t.green)
fg("DiagnosticUnderlineHint", t.violet)
fg("DiagnosticUnderlineOk", t.green)
fg_bg('DiagnosticSignError', t.red, t.bg)
fg_bg('DiagnosticSignWarn', t.yellow, t.bg)
fg_bg('DiagnosticSignInfo', t.blue, t.bg)
fg_bg('DiagnosticSignHint', t.violet, t.bg)

fg_bg("Error", t.red, t.bg1)

-- cmd line
fg_bg("WildMenu", t.fg, t.indigo) -- auto complete in cmdline
fg_bg("ErrorMsg", t.red, t.bg)    -- error msg in cmdline
fg_bg("WarningMsg", t.yellow, t.bg)
fg("MoreMsg", t.green)
fg("Question", t.green)

fg("Directory", t.teal)

fg_bg("WinSeparator", t.fgSubtle, t.bg)

fg_bg("DiffChange", t.yellow, t.bg)
fg_bg("DiffAdd", t.green, t.bg)
bg("DiffText", t.bg)
fg_bg("DiffDelete", t.red, t.bg)

fg("ModeMsg", t.green)

fg("Added", t.green)
fg("Changed", t.yellow)
fg("Removed", t.red)

undercurl("SpellBad", t.red)
undercurl("SpellCap", t.yellow)

fg_bg("StatusLine", t.fg, t.bg1)
fg_bg("StatusLineNC", t.fg, t.bg1)
