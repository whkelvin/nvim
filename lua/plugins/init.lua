local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    {
      "gbprod/cutlass.nvim",
      opts = {
        cut_key = "x",
      },
    },
    {
      'yorickpeterse/nvim-pqf',
      config = function()
        require('pqf').setup({
          signs = {
            error = { text = '', hl = 'DiagnosticSignError' },
            warning = { text = '', hl = 'DiagnosticSignWarn' },
            info = { text = '', hl = 'DiagnosticSignInfo' },
            hint = { text = '', hl = 'DiagnosticSignHint' },
          },

          -- By default, only the first line of a multi line message will be shown.
          -- When this is true, multiple lines will be shown for an entry, separated by
          -- a space
          show_multiple_lines = false,

          -- How long filenames in the quickfix are allowed to be. 0 means no limit.
          -- Filenames above this limit will be truncated from the beginning with
          -- `filename_truncate_prefix`.
          max_filename_length = 0,

          -- Prefix to use for truncated filenames.
          filename_truncate_prefix = '[...]',
        })
      end
    },
    {
      "nvim-tree/nvim-web-devicons",
      lazy = false,
    },
    {
      "nvim-tree/nvim-tree.lua",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      opts = require("plugins.configs.nvim-tree"),
      lazy = false
    },
    {
      "nvim-telescope/telescope.nvim",
      depedencies = { { "nvim-lua/plenary.nvim" } },
      tag = "0.1.8",
      --opts = require("plugins.configs.telescope"),
      config = function()
        require("plugins.configs.telescope")
      end,
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
    },
    {
      "neovim/nvim-lspconfig",
      opts = {},
      config = function()
        require("plugins.configs.lspconfig")
      end,
    },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    {
      "hrsh7th/nvim-cmp",
      config = function()
        require("plugins.configs.cmp")
      end,
    },
    { "saadparwaiz1/cmp_luasnip" },
    {
      "nvim-treesitter/nvim-treesitter",
      cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
      config = function()
        require("plugins.configs.treesitter")
      end,
    },
    {
      "lewis6991/gitsigns.nvim",
      opts = require("plugins.configs.gitsigns"),
      lazy = false
    },
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      opts = require("plugins.configs.surround")
    },
    {
      "phaazon/hop.nvim",
      branch = "v1",
      opts = {
        keys = "asdfghjkl;",
      },
    },
    { "rafamadriz/friendly-snippets" },
    {
      "L3MON4D3/LuaSnip",
      depedencies = { {
        "rafamadriz/friendly-snippets",
      } },
      version = "v2.*",
      opts = {
        history = true,
        updateevents = "TextChanged,TextChangedI",
      },
      config = function()
        local luasnip = require "luasnip"
        luasnip.filetype_extend("typescriptreact", { "html" })
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    { "nvimtools/none-ls.nvim",
      dependencies = {
        "nvimtools/none-ls-extras.nvim",
      },
    },
    {
      "startup-nvim/startup.nvim",
      depedencies = { { "nvim-telescope/telescope.nvim" }, { "nvim-lua/plenary.nvim" } },
      opts = require("plugins.configs.startup"),
    },

    {
      "kyazdani42/nvim-web-devicons",
    },
    {
      'nvim-lualine/lualine.nvim',
      opts = require('plugins.configs.lualine'),
      dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    { "echasnovski/mini.icons",         version = "*" },
    { "folke/which-key.nvim",           depedencies = { { "echasnovski/mini.icons", version = "*" } } },
    {
      "norcalli/nvim-colorizer.lua",
      opts = {
        "*",
      },
    },
    { "andymass/vim-matchup" },
    {
      "windwp/nvim-ts-autotag",
      opts = {
        opts = {
          -- Defaults
          enable_close = true,           -- Auto close tags
          enable_rename = true,          -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
      },
    },
    {
      "stevearc/oil.nvim",
      opts = require("plugins.configs.oil"),
      dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },
    { "hrsh7th/cmp-cmdline" },
    {
      "rmagatti/goto-preview",
      event = "BufEnter",
      config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
      opts = {
        height = 20,
        post_open_hook = function(buf, win)
          vim.api.nvim_create_autocmd({ "WinLeave" }, {
            buffer = buf,
            callback = function()
              vim.api.nvim_win_close(win, false)
              return true
            end,
          })
        end,
      },
    },
    { 'ThePrimeagen/harpoon' },
    {
      "rest-nvim/rest.nvim",
    },
    {
      "ziontee113/icon-picker.nvim",
      config = function()
        require("icon-picker").setup({ disable_legacy_commands = true })
      end
    },
    {
      "mg979/vim-visual-multi",
      init = function()
        vim.g.VM_maps = {
          ['Find Under'] = '<leader>c',
          ['Find Subword Under'] = '<leader>c',
          ["Undo"] = 'u',
          ["Redo"] = '<C-r>',
          ["Mouse Cursor"] = '<C-LeftMouse>',
          ["Add Cursor Up"] = '<S-Up>',
          ["Add Cursor Down"] = '<S-Down>',
        }
      end
    },
    {
      'akinsho/git-conflict.nvim',
      version = "*",
      --opt = require('plugins.configs.git-conflict'),
      config = true,
    },
    --{
    --  "yetone/avante.nvim",
    --  event = "VeryLazy",
    --  lazy = false,
    --  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    --  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    --  build = "make",
    --  opts = require('plugins.configs.avante'),
    --  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    --  dependencies = {
    --    "nvim-treesitter/nvim-treesitter",
    --    "stevearc/dressing.nvim",
    --    "nvim-lua/plenary.nvim",
    --    "MunifTanjim/nui.nvim",
    --    --- The below dependencies are optional,
    --    "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    --    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    --    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    --    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    --    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    --    -- "zbirenbaum/copilot.lua",        -- for providers='copilot'
    --    {
    --      -- support for image pasting
    --      "HakonHarnes/img-clip.nvim",
    --      event = "VeryLazy",
    --      opts = {
    --        -- recommended settings
    --        default = {
    --          embed_image_as_base64 = false,
    --          prompt_for_file_name = false,
    --          drag_and_drop = {
    --            insert_mode = true,
    --          },
    --          -- required for Windows users
    --          use_absolute_path = true,
    --        },
    --      },
    --    },
    --     {
    --       -- Make sure to set this up properly if you have lazy=true
    --       'MeanderingProgrammer/render-markdown.nvim',
    --       opts = require('plugins.configs.markdown'),
    --       ft = { "markdown", "Avante" },
    --     },
    --   },
    --},
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      --opts = {
      --  library = {
      --    -- See the configuration section for more details
      --    -- Load luvit types when the `vim.uv` word is found
      --    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      --  },
      --},
    },
  },
  install = { colorscheme = { "nordtheme" } },
  checker = { enabled = true },
})
