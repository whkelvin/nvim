local fileUtil = require("plugins.configs.utils.file")
local colors = require("colors/theme")
local custom_theme = {
  normal = {
    a = { fg = colors.blue, bg = colors.bg2, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    c = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    x = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    y = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    z = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
  },
  insert = {
    a = { fg = colors.teal, bg = colors.bg2, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    c = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    x = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    y = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    z = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
  },
  visual = {
    a = { fg = colors.cyan, bg = colors.bg2, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    c = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    x = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    y = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    z = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
  },
  replace = {
    a = { fg = colors.cyan, bg = colors.bg2, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    c = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    x = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    y = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
    z = { fg = colors.fg, bg = colors.bg2, gui = 'bold' },
  },
  inactive = {
    a = { fg = colors.fgSubtle, bg = colors.bg2, gui = 'bold' },
    b = { fg = colors.fgSubtle, bg = colors.bg2, gui = 'bold' },
    c = { fg = colors.fgSubtle, bg = colors.bg2, gui = 'bold' },
    x = { fg = colors.fgSubtle, bg = colors.bg2, gui = 'bold' },
    y = { fg = colors.fgSubtle, bg = colors.bg2, gui = 'bold' },
    z = { fg = colors.fgSubtle, bg = colors.bg2, gui = 'bold' },
  },
}

local lsp = vim.lsp
local diagnostic = vim.diagnostic

function lsp_client_names()
  local clients = {}

  for _, client in pairs(lsp.buf_get_clients(0)) do
    clients[#clients + 1] = client.name
  end

  return table.concat(clients, ' '), ' '
end

function get_diagnostics_count(severity)
  local count = vim.tbl_count(diagnostic.get(0, severity and { severity = severity }))
  if count > 0 then
    return ' ' .. vim.tbl_count(diagnostic.get(0, severity and { severity = severity }))
  end
  return ''
end

return {
  options = {
    icons_enabled = true,
    theme = custom_theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {
        "startup",
        "Avante",
        "AvanteSelectedFiles",
        "AvanteInput",
        "qf"
      },
      winbar = {
        "startup",
        "Avante",
        "AvanteSelectedFiles",
        "AvanteInput",
      },
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = {},
    lualine_x = { 'diagnostics' },
    lualine_y = { lsp_client_names },
    lualine_z = { 'filetype' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {
    lualine_a = {
      function()
        return fileUtil.file_info({ icon = false }, { type = "full-path" })
      end
    },
  },
  inactive_winbar = {
    lualine_a = {
      function()
        return fileUtil.file_info({ icon = false }, { type = "full-path" })
      end
    },
  },
  extensions = {}
}
