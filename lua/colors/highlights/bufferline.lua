local theme = require("colors/theme")

theme.highlight_fg_bg("BufferLineBackground", theme.colors.grey_fg, theme.colors.black2)
-- buffers
theme.highlight_fg_bg("BufferLineBufferSelected", theme.colors.white, theme.colors.black)
theme.highlight_gui("BufferLineBufferSelected", "bold")
theme.highlight_fg_bg("BufferLineBufferVisible", theme.colors.light_grey, theme.colors.black2)
-- for diagnostics = "nvim_lsp"
theme.highlight_fg_bg("BufferLineError", theme.colors.light_grey, theme.colors.black2)
theme.highlight_fg_bg("BufferLineErrorDiagnostic", theme.colors.light_grey, theme.colors.black2)
-- close buttons
theme.highlight_fg_bg("BufferLineCloseButton", theme.colors.light_grey, theme.colors.black2)
theme.highlight_fg_bg("BufferLineCloseButtonVisible", theme.colors.light_grey, theme.colors.black2)
theme.highlight_fg_bg("BufferLineCloseButtonSelected", theme.colors.red, theme.colors.black)
theme.highlight_fg_bg("BufferLineFill", theme.colors.grey_fg, theme.colors.black2)
theme.highlight_fg_bg("BufferlineIndicatorSelected", theme.colors.black, theme.colors.black)
-- modified
theme.highlight_fg_bg("BufferLineModified", theme.colors.red, theme.colors.black2)
theme.highlight_fg_bg("BufferLineModifiedVisible", theme.colors.red, theme.colors.black2)
theme.highlight_fg_bg("BufferLineModifiedSelected", theme.colors.green, theme.colors.black)
-- separators
theme.highlight_fg_bg("BufferLineSeparator", theme.colors.black2, theme.colors.black2)
theme.highlight_fg_bg("BufferLineSeparatorVisible", theme.colors.black2, theme.colors.black2)
theme.highlight_fg_bg("BufferLineSeparatorSelected", theme.colors.black2, theme.colors.black2)
-- tabs
theme.highlight_fg_bg("BufferLineTab", theme.colors.light_grey, theme.colors.one_bg3)
theme.highlight_fg_bg("BufferLineTabSelected", theme.colors.black2, theme.colors.nord_blue)
theme.highlight_fg_bg("BufferLineTabClose", theme.colors.red, theme.colors.black)
theme.highlight_bg("BufferLineDevIconDefaultInactive", "NONE")
theme.highlight_bg("BufferLineDevIconDefaultSelected", "NONE")
theme.highlight_fg_bg("BufferLineDuplicate", "NONE", theme.colors.black2)
theme.highlight_fg_bg("BufferLineDuplicateSelected", theme.colors.red, theme.colors.black)
theme.highlight_fg_bg("BufferLineDuplicateVisible", theme.colors.blue, theme.colors.black2)
-- custom area
theme.highlight_fg_bg("BufferLineRightCustomAreaText1", theme.colors.white, theme.colors.grey)
theme.highlight_fg("BufferLineRightCustomAreaText2", theme.colors.red)
