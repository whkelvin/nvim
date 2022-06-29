require('options')
require('plugins')
require('mappings')
require('colors')

vim.g.do_filetype_lua = 1

--this disable status line in nvim tree
vim.api.nvim_exec(
[[
  au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree_1" | set laststatus=0 | else | set laststatus=2 | endif
]],
false
)
