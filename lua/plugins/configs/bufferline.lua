local present, bufferline = pcall(require, "bufferline")
if not present then
  print('bufferline not present!')
  return
end

local colors = {
   white = "#abb2bf",
   darker_black = "#2a303c",
   black = "#2E3440", --  nvim bg
   black2 = "#343a46",
   one_bg = "#373d49",
   one_bg2 = "#464c58",
   one_bg3 = "#494f5b",
   grey = "#4b515d",
   grey_fg = "#565c68",
   grey_fg2 = "#606672",
   light_grey = "#646a76",
   red = "#BF616A",
   baby_pink = "#de878f",
   pink = "#d57780",
   line = "#3a404c", -- for lines like vertsplit
   green = "#A3BE8C",
   vibrant_green = "#afca98",
   blue = "#7797b7",
   nord_blue = "#81A1C1",
   yellow = "#EBCB8B",
   sun = "#e1c181",
   purple = "#aab1be",
   dark_purple = "#B48EAD",
   teal = "#6484a4",
   orange = "#e39a83",
   cyan = "#9aafe6",
   statusline_bg = "#333945",
   lightbg = "#3f4551",
   lightbg2 = "#393f4b",
   pmenu_bg = "#A3BE8C",
   folder_bg = "#7797b7",
}


local options = {
   options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 2 } },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      show_close_icon = true,
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 25,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = false,
      custom_filter = function(buf_number)
         -- Func to filter out our managed/persistent split terms
         local present_type, type = pcall(function()
            return vim.api.nvim_buf_get_var(buf_number, "term_type")
         end)

         if present_type then
            if type == "vert" then
               return false
            elseif type == "hori" then
               return false
            end
            return true
         end

         return true
      end,
   },

   highlights = {
      background = {
         guifg = colors.grey_fg,
         guibg = colors.black2,
      },

      -- buffers
      buffer_selected = {
         guifg = colors.white,
         guibg = colors.black,
         gui = "bold",
      },
      buffer_visible = {
         guifg = colors.light_grey,
         guibg = colors.black2,
      },

      -- for diagnostics = "nvim_lsp"
      error = {
         guifg = colors.light_grey,
         guibg = colors.black2,
      },
      error_diagnostic = {
         guifg = colors.light_grey,
         guibg = colors.black2,
      },

      -- close buttons
      close_button = {
         guifg = colors.light_grey,
         guibg = colors.black2,
      },
      close_button_visible = {
         guifg = colors.light_grey,
         guibg = colors.black2,
      },
      close_button_selected = {
         guifg = colors.red,
         guibg = colors.black,
      },
      fill = {
         guifg = colors.grey_fg,
         guibg = colors.black2,
      },
      indicator_selected = {
         guifg = colors.black,
         guibg = colors.black,
      },

      -- modified
      modified = {
         guifg = colors.red,
         guibg = colors.black2,
      },
      modified_visible = {
         guifg = colors.red,
         guibg = colors.black2,
      },
      modified_selected = {
         guifg = colors.green,
         guibg = colors.black,
      },

      -- separators
      separator = {
         guifg = colors.black2,
         guibg = colors.black2,
      },
      separator_visible = {
         guifg = colors.black2,
         guibg = colors.black2,
      },
      separator_selected = {
         guifg = colors.black2,
         guibg = colors.black2,
      },

      -- tabs
      tab = {
         guifg = colors.light_grey,
         guibg = colors.one_bg3,
      },
      tab_selected = {
         guifg = colors.black2,
         guibg = colors.nord_blue,
      },
      tab_close = {
         guifg = colors.red,
         guibg = colors.black,
      },
   },
}

bufferline.setup(options)
