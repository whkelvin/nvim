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
