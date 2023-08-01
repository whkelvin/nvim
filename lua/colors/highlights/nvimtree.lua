local t = require("colors/theme")
local fg = t.highlight_fg
local bg = t.highlight_bg
local fg_bg = t.highlight_fg_bg

local nvimTreeBg = t.bg1
fg("NvimTreeRootFolder", t.yellow)
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
