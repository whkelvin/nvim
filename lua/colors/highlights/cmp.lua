local t = require("colors/theme")
local fg = t.highlight_fg
local bg = t.highlight_bg
local fg_bg = t.highlight_fg_bg

fg("CmpItemAbbr", t.fg)
fg("CmpBorder", t.fgSubtle)
fg("CmpDocBorder", t.fgSubtle)

fg("CmpItemKindConstant", t.blue)
fg("CmpItemKindStructure", t.blue)
fg("CmpItemKindStruct", t.blue)
fg("CmpItemKindType", t.blue)
fg("CmpItemKindKeyword", t.blue)

fg("CmpItemKindFunction", t.teal)
fg("CmpItemKindMethod", t.teal)
fg("CmpItemKindConstructor", t.teal)

fg("CmpItemKindIdentifier", t.fg)
fg("CmpItemKindField", t.fg)
fg("CmpItemKindVariable", t.fg)
fg("CmpItemKindSnippet", t.orange)
fg("CmpItemKindText", t.green)

fg("CmpItemKindFolder", t.blue)
fg("CmpItemKindFile", t.blue)
fg("CmpItemKindModule", t.blue)
fg("CmpItemKindProperty", t.blue)
fg("CmpItemKindUnit", t.blue)
fg("CmpItemKindColor", t.cyan)
fg("CmpItemKindReference", t.blue)
fg("CmpItemKindOperator", t.fg)
fg("CmpItemKindTypeParameter", t.fg)
fg("highlightCmpItemAbbrMatch", t.teal)
fg_bg("CmpItemMenu", t.fg, t.blue)
bg("Pmenu", t.bg1)
bg("PmenuSbar", t.bg2)
fg_bg("PmenuSel", t.bg1, t.teal)
bg("PmenuThumb", t.teal)

fg("CmpItemAbbrMatch", t.fg)
fg("CmpItemKind", t.fg)
