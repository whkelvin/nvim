-- Ensure diff highlights never have underline
local function remove_diff_underline()
  vim.cmd("hi! DiffChange gui=NONE guisp=NONE")
  vim.cmd("hi! DiffAdd gui=NONE guisp=NONE")
  vim.cmd("hi! DiffText gui=NONE guisp=NONE")
  vim.cmd("hi! DiffDelete gui=NONE guisp=NONE")
  vim.cmd("hi! CursorLine gui=NONE guisp=NONE")
  
  -- Create a CursorLine highlight specifically for diff mode without underline
  local t = require("colors.theme")
  vim.cmd("hi! CursorLineDiff guibg=" .. t.bg2 .. " gui=NONE guisp=NONE")
end

-- Remove underline when colorscheme loads and when entering diff mode
vim.api.nvim_create_autocmd({ "ColorScheme", "OptionSet" }, {
  pattern = "diff",
  callback = remove_diff_underline,
})

-- Override CursorLine in diff windows to prevent underline
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "OptionSet" }, {
  pattern = "diff",
  callback = function()
    if vim.wo.diff then
      -- Disable cursorline and handle it manually via extmarks
      vim.wo.cursorline = false
    else
      vim.wo.cursorline = true
    end
  end,
})

-- Diagnostic function to check what highlights are applied
local function check_line_highlights()
  if vim.wo.diff then
    local line = vim.fn.line(".")
    local col = 1
    local syn_id = vim.fn.synID(line, col, 1)
    local trans_id = vim.fn.synIDtrans(syn_id)
    local name = vim.fn.synIDattr(syn_id, "name")
    local trans_name = vim.fn.synIDattr(trans_id, "name")
    
    -- Get the actual highlight definition
    local hl_def = vim.api.nvim_get_hl(0, { name = trans_name })
    
    print(string.format("Line %d: synID=%s, transID=%s", line, name, trans_name))
    print(string.format("Highlight: %s", vim.inspect(hl_def)))
    
    -- Check CursorLine highlight
    local cursorline_hl = vim.api.nvim_get_hl(0, { name = "CursorLine" })
    print(string.format("CursorLine: %s", vim.inspect(cursorline_hl)))
    
    -- Check what extmarks are on this line
    local extmarks = vim.api.nvim_buf_get_extmarks(0, -1, {line - 1, 0}, {line - 1, -1}, {details = true})
    print(string.format("Extmarks: %s", vim.inspect(extmarks)))
  end
end

-- Command to check highlights (for debugging)
vim.api.nvim_create_user_command("CheckDiffHighlights", check_line_highlights, {})

-- Apply cursorline diff highlights without underline when cursor is over diff sections
local diff_namespace = vim.api.nvim_create_namespace("diff_cursorline_no_underline")
local t = require("colors.theme")

local function update_cursorline_diff()
  -- Clear previous extmarks
  vim.api.nvim_buf_clear_namespace(0, diff_namespace, 0, -1)
  
  -- Only apply in diff mode
  if vim.wo.diff then
    local current_line = vim.fn.line(".") - 1 -- 0-indexed
    local syntax_name = vim.fn.synIDattr(vim.fn.synID(current_line + 1, 1, 1), "name")
    
    -- Map syntax names to background colors
    local bg_map = {
      ["DiffAdd"] = t.diff_add,
      ["DiffChange"] = t.diff_change,
      ["DiffText"] = t.diff_change2,
      ["DiffDelete"] = t.diff_delete,
    }
    
    -- Get the diff background color for current line
    local diff_bg = nil
    for diff_type, bg_color in pairs(bg_map) do
      if syntax_name:match(diff_type) then
        diff_bg = bg_color
        break
      end
    end
    
    -- If it's a diff line, use diff background, otherwise use normal cursorline background
    local cursorline_bg = diff_bg or t.bg2
    local hl_name = diff_bg and ("CursorLineDiffTemp" .. syntax_name:match("Diff(%w+)")) or "CursorLineDiffNormal"
    
    -- Define highlight with background but explicitly no underline
    vim.cmd(string.format("hi! %s guibg=%s gui=NONE guisp=NONE cterm=NONE", hl_name, cursorline_bg))
    
    -- Add extmark to apply cursorline background without underline
    vim.api.nvim_buf_set_extmark(0, diff_namespace, current_line, 0, {
      end_line = current_line + 1,
      end_col = 0,
      hl_group = hl_name,
      priority = 1000, -- Very high priority to override everything
      hl_mode = "replace", -- Replace to ensure no underline
    })
  end
end

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "WinEnter", "BufEnter" }, {
  callback = update_cursorline_diff,
})

-- open help and qf page in a verticle split by default
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.cmd("wincmd L")
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- open qf in vsplit
    vim.cmd("wincmd L")
    vim.keymap.set("n", "<CR>", function()
      local qf_entry = vim.fn.getqflist()[vim.fn.line('.')]
      local qf_winid = vim.fn.win_getid() -- Get the window ID of the quickfix window
      local target_bufnr = qf_entry.bufnr

      -- Replace the quickfix buffer with the target buffer
      vim.api.nvim_win_set_buf(qf_winid, target_bufnr)

      -- Add safety checks for cursor positioning
      local line = qf_entry.lnum
      local col = qf_entry.col - 1
      local buf_line_count = vim.api.nvim_buf_line_count(target_bufnr)
      if col < 0 then
        col = 0
      end
      -- Ensure line number is valid
      if line > 0 and line <= buf_line_count then
        -- Ensure column number is valid
        local line_length = #vim.api.nvim_buf_get_lines(target_bufnr, line - 1, line, true)[1]
        col = math.min(col, math.max(0, line_length - 1))
        vim.api.nvim_win_set_cursor(qf_winid, { line, col })
      end
    end, { buffer = true })
  end
})
