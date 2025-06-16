require("autocmd")
require("options") -- pure nvim options
require("plugins") -- plugins
require("mappings")
require("colors")

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

local function send_diagnostics_to_qf()
  local diagnostics = vim.diagnostic.get()
  local qf_list = {}

  for _, diagnostic in ipairs(diagnostics) do
    local bufnr = diagnostic.bufnr or 0
    local filename = vim.api.nvim_buf_get_name(bufnr)
    table.insert(qf_list, {
      bufnr = bufnr,
      filename = filename,
      lnum = diagnostic.lnum + 1, -- Line numbers are 0-indexed internally
      col = diagnostic.col + 1,   -- Columns are also 0-indexed
      text = diagnostic.message,
      type = vim.diagnostic.severity[diagnostic.severity] or "E"
    })
  end

  if #qf_list > 0 then
    vim.fn.setqflist(qf_list, 'r') -- Replace the quickfix list
    vim.cmd("copen")               -- Open quickfix window
  else
    print("No diagnostics found.")
  end
end

-- Create a user command to trigger it
vim.api.nvim_create_user_command('LspDiagnosticsToQF', send_diagnostics_to_qf, {})
