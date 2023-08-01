local t = require("colors/theme")
local fg = t.highlight_fg
local bg = t.highlight_bg
local fg_bg = t.highlight_fg_bg

fg("Conditional", t.teal)
fg("Define", t.teal)
fg("Exception", t.teal)
fg("Function", t.teal)
fg("Include", t.teal)
fg("Keyword", t.teal)
fg("Label", t.teal)
fg("PreProc", t.teal)
fg("Repeat", t.teal)
fg("StorageClass", t.teal)

fg("Boolean", t.blue)
fg("Constant", t.blue)
fg("Delimiter", t.blue)
fg("Statement", t.fg)
fg("Structure", t.blue)
fg("Type", t.blue)
fg("Typedef", t.blue)

fg("Identifier", t.fg)

fg("Float", t.orange)
fg("Number", t.orange)

fg("Comment", t.fgSubtle)
fg("Character", t.green)
fg("String", t.green)
fg("Underlined", t.cyan)
fg("Title", t.violet)
fg("Operator", t.fg)

fg("Special", t.cyan)
fg("SpecialChar", t.cyan)

fg("Tag", t.teal)
fg_bg("Todo", t.yellow, t.bg)
