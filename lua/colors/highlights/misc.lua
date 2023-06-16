local theme = require("colors/theme")

theme.highlight_fg_bg("MatchParen", theme.base16.base00, theme.base16.base0F)
theme.highlight_fg_bg("MatchWord", theme.base16.base00, theme.base16.base0D)
theme.highlight_fg_bg("Substitute", theme.base16.base00, theme.base16.base0D)
theme.highlight_fg_bg("IncSearch", theme.base16.base00, theme.base16.base0D)
theme.highlight_fg_bg("Search", theme.base16.base00, theme.base16.base0D)
-- theme.highlight_fg_bg('Visual', theme.base16.base00, theme.base16.base0D)
theme.highlight_bg("Visual", theme.base16.base02)
theme.highlight_fg_bg("Cursor", theme.base16.base00, theme.base16.base05)
theme.highlight_fg_bg("Normal", theme.base16.base05, theme.base16.base00)
theme.highlight_fg_bg("Error", theme.base16.base00, theme.base16.base08)
theme.highlight_fg_bg("ErrorMsg", theme.base16.base08, theme.base16.base00)
theme.highlight_fg_bg("FoldColumn", theme.base16.base0C, theme.base16.base01)
theme.highlight_fg_bg("Folded", theme.base16.base03, theme.base16.base01)
theme.highlight_fg_bg("Search", theme.base16.base00, theme.base16.base0D)
theme.highlight_fg_bg("WildMenu", theme.base16.base08, theme.base16.base0A)
theme.highlight_bg("SignColumn", theme.base16.base00)
theme.highlight_fg("NonText", theme.base16.base03)
theme.highlight_fg("Debug", theme.base16.base08)
theme.highlight_fg("Title", theme.base16.base0D)
theme.highlight_fg("Directory", theme.base16.base0D)
theme.highlight_fg("Exception", theme.base16.base08)
theme.highlight_fg("Macro", theme.base16.base08)
theme.highlight_fg("ModeMsg", theme.base16.base0B)
theme.highlight_fg("MoreMsg", theme.base16.base0B)
theme.highlight_fg("Question", theme.base16.base0D)
theme.highlight_fg("SpecialKey", theme.base16.base03)
theme.highlight_fg("TooLong", theme.base16.base08)
theme.highlight_fg("UnderLined", theme.base16.base0B)
theme.highlight_fg("VisualNOS", theme.base16.base08)
theme.highlight_fg("WarningMsg", theme.base16.base08)
theme.highlight_bg("Conceal", "NONE")
theme.highlight_bg("ColorColumn", theme.base16.base01)
theme.highlight_bg("CursorColumn", theme.base16.base01)
theme.highlight_bg("CursorLine", theme.base16.base01)
theme.highlight_bg("CursorLineNr", theme.base16.base00)
theme.highlight_bg("QuickFixLine", theme.base16.base01)
theme.highlight_bg("StatusLine", "NONE")

theme.highlight_fg("Comment", theme.colors.grey_fg)
theme.highlight_fg("CursorLineNr", theme.colors.white)
theme.highlight_fg("LineNr", theme.colors.grey)
theme.highlight_fg("EndOfBuffer", theme.colors.black)
theme.highlight_fg("FloatBorder", theme.colors.blue)
theme.highlight_fg("NvimInternalError", theme.colors.red)
theme.highlight_fg("WinSeparator", theme.colors.one_bg2)
theme.highlight_bg("NormalFloat", theme.colors.darker_black)

theme.highlight_bg("RegistersWindow", theme.colors.darker_black)

---- Indent blankline
--IndentBlanklineChar = { fg = line },
--IndentBlanklineSpaceChar = { fg = line },
--
---- Lsp Diagnostics
--DiagnosticHint = { fg = purple },
--DiagnosticError = { fg = red },
--DiagnosticWarn = { fg = yellow },
--DiagnosticInformation = { fg = green },
