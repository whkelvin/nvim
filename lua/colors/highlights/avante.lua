local t = require("colors/theme")
local fg_bg = t.highlight_fg_bg

fg_bg("AvanteTitle", t.bg, t.teal)
fg_bg("AvanteReversedTitle", t.teal, t.bg)
fg_bg("AvanteSubtitle", t.bg, t.blue)
fg_bg("AvanteReversedSubtitle", t.blue, t.bg)

fg_bg("AvanteThirdTitle", t.bg, t.blue)
fg_bg("AvanteReversedThirdTitle", t.blue, t.bg)

fg_bg("AvanteConflictCurrnt", t.red, t.bg1)
fg_bg("AvanteConflictIncoming", t.green, t.bg1)

fg_bg("AvanteConflictCurrentLabel", t.fg, t.red)
fg_bg("AvanteConflictIncomingLabel", t.fg, t.green)

fg_bg("AvantePopupHint", t.violet, t.bg)
fg_bg("AvanteInlineHint", t.violet, t.bg)
