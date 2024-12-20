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
      "nvim-tree/nvim-tree.lua",
      depedencies = {
        {
          "nvim-tree/nvim-web-devicons",
        },
      },
      opts = require("plugins.configs.nvim-tree"),
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
    },
    {
      "ur4ltz/surround.nvim",
      opts = { mappings_style = "sandwich" },
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
    { "jose-elias-alvarez/null-ls.nvim" },
    {
      "startup-nvim/startup.nvim",
      depedencies = { { "nvim-telescope/telescope.nvim" }, { "nvim-lua/plenary.nvim" } },
      opts = require("plugins.configs.startup"),
    },

    {
      "kyazdani42/nvim-web-devicons",
    },
    {
      "feline-nvim/feline.nvim",
      depedencies = {
        {
          "kyazdani42/nvim-web-devicons",
        },
      },
      config = function()
        require("plugins.configs.feline")
      end,
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
    }
  },
  install = { colorscheme = { "nordtheme" } },
  checker = { enabled = true },
})
