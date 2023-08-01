local t = require("colors/theme")
local fg = t.highlight_fg
local bg = t.highlight_bg
local fg_bg = t.highlight_fg_bg

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
