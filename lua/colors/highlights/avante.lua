local t = require("colors/theme")
local fg_bg = t.highlight_fg_bg
local bg = t.highlight_bg

fg_bg("AvanteTitle", t.bg, t.teal)
fg_bg("AvanteReversedTitle", t.teal, t.bg)
fg_bg("AvanteSubtitle", t.bg, t.blue)
fg_bg("AvanteReversedSubtitle", t.blue, t.bg)

fg_bg("AvanteThirdTitle", t.bg, t.blue)
fg_bg("AvanteReversedThirdTitle", t.blue, t.bg)

bg("AvanteConflictCurrent", t.lightRed)
bg("AvanteConflictIncoming", t.lightGreen)

fg_bg("AvanteConflictCurrentLabel", t.red, t.bg1)
fg_bg("AvanteConflictIncomingLabel", t.green, t.bg1)

fg_bg("AvantePopupHint", t.violet, t.bg)
fg_bg("AvanteInlineHint", t.violet, t.bg)

bg('GitConflictCurrent', t.lightRed)
bg('GitConflictIncoming', t.lightGreen)
bg('GitConflictAncestor', t.glass)

fg_bg('GitConflictCurrentLabel', t.red, t.bg1)
fg_bg('GitConflictIncomingLabel', t.green, t.bg1)
fg_bg('GitConflictAncestorLabel', t.blue, t.bg1)
