local opt = vim.opt
local g = vim.g

g.loaded_netrw = true
g.loaded_netrwPlugin = true

g.mapleader = " "

-- Decorations
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = false
opt.cul = true -- cursor line
opt.signcolumn = "yes"
opt.termguicolors = true

-- Indentline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 4

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Enable Mouse for all modes
opt.mouse = "a"

opt.splitbelow = true
opt.splitright = true

opt.timeout = true
opt.timeoutlen = 400
opt.updatetime = 250

opt.title = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 1

-- Not sure what these are, but when something breaks, check this
-- opt.fillchars = { eob = " " }
-- opt.laststatus = 3 -- global statusline
-- opt.hidden = true
-- opt.undofile = true
