-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
      options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--map = function(mode, keys, command, opt)
--   local options = { noremap = true, silent = true }
--
--   if opt then
--      options = vim.tbl_extend("force", options, opt)
--   end
--
--   if type(keys) == "table" then
--      for _, keymap in ipairs(keys) do
--         map(mode, keymap, command, opt)
--      end
--      return
--   end
--
--   vim.keymap.set(mode, keys, command, opt)
--   vim.api.nvim_set_keymap(mode, keys, command, opt)
--end

-- navigation between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- NvimTree
map("n", "<leader>n", ":NvimTreeToggle<CR>")

-- Bufferline
map("n", "<TAB>", "<cmd> :BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> :BufferLineCyclePrev <CR>")
map("n", "<leader>x", "<cmd> :bd <CR>") -- close current buffer
map("n", "<leader>X", "<cmd> :bd! <CR>")

-- Telescope
map("n", "<leader>f", "<cmd> :Telescope find_files <CR>")
map("n", "<leader>fa", "<cmd> :Telescope find_files follow=true no_ignore=true hidden=true <CR>")
map("n", "<leader>b", "<cmd> :Telescope buffers<CR>")
map("n", "<leader>cm", "<cmd> :Telescope git_commits <CR>")
map("n", "<leader>gt", "<cmd> :Telescope git_status <CR>")
map("n", "<leader>ss", "<cmd> :Telescope live_grep <CR>")
map("n", "<leader>s", "<cmd> :lua require('telescope.builtin').current_buffer_fuzzy_find() <CR>")

map("n", "<ESC>", "<cmd> :noh <CR>")

-- Hop
map("n", "f", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>")
map("n", "F", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>")
map("o", "f", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")
map("o", "F", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>")

map("n", "<leader>/", "<cmd> :HopPattern <cr>")
map("o", "<leader>/", "<cmd> :HopPattern <cr>")
map("v", "<leader>/", "<cmd> :HopPattern <cr>")
