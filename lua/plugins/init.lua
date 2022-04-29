print('Loading Plugins...')

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      require('plugins.configs.nvim-tree')
    end,
  }

  use {
    'NvChad/nvim-base16.lua',
    config = function()
      require('plugins.configs.nvim-base16')
    end,
  }

  use {
    'feline-nvim/feline.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      require('plugins.configs.feline')
    end,
  }

  use{ 
    'akinsho/bufferline.nvim',
    config = function()
      require('plugins.configs.bufferline')
    end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('plugins.configs.telescope')
    end,
  }

  use { 
    'L3MON4D3/LuaSnip',
    config = function()
      require('plugins.configs.luasnip')
    end,
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {{'hrsh7th/cmp-nvim-lsp'}},
    config = function()
      require('plugins.configs.lspconfig')
      require('plugins.configs.cmp')
    end,
  }

  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  use {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('plugins.configs.colorizer')
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
    config = function()
      require('plugins.configs.treesitter')
    end,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.configs.indent-blankline')
    end,
  }

end)

--local plugins = {
   --["lewis6991/impatient.nvim"] = {},

--   ["wbthomason/packer.nvim"] = {
--      event = "VimEnter",
--   },
--
--   ["NvChad/extensions"] = {},
--
--   ["NvChad/nvim-base16.lua"] = {
--      after = "packer.nvim",
--      config = function()
--         require("colors").init()
--      end,
--   },

--   ["kyazdani42/nvim-web-devicons"] = {
--      after = "nvim-base16.lua",
--      config = function()
--         require "plugins.configs.icons"
--      end,
--   },

--   ["feline-nvim/feline.nvim"] = {
--      after = "nvim-web-devicons",
--      config = function()
--         require "plugins.configs.statusline"
--      end,
--   },

--   ["akinsho/bufferline.nvim"] = {
--      after = "nvim-web-devicons",
--
--      setup = function()
--         require("core.mappings").bufferline()
--      end,
--
--      config = function()
--         require "plugins.configs.bufferline"
--      end,
--   },

--   ["lukas-reineke/indent-blankline.nvim"] = {
--      event = "BufRead",
--      config = function()
--         require("plugins.configs.others").blankline()
--      end,
--   },

--   ["NvChad/nvim-colorizer.lua"] = {
--      event = "BufRead",
--      config = function()
--         require("plugins.configs.others").colorizer()
--      end,
--   },

--   ["nvim-treesitter/nvim-treesitter"] = {
--      event = { "BufRead", "BufNewFile" },
--      run = ":TSUpdate",
--      config = function()
--         require "plugins.configs.treesitter"
--      end,
--   },

   -- git stuff
--   ["lewis6991/gitsigns.nvim"] = {
--      opt = true,
--      config = function()
--         require("plugins.configs.others").gitsigns()
--      end,
--      setup = function()
--         require("core.utils").packer_lazy_load "gitsigns.nvim"
--      end,
--   },
--
--   -- lsp stuff
--
--   ["neovim/nvim-lspconfig"] = {
--      module = "lspconfig",
--      opt = true,
--      setup = function()
--         require("core.utils").packer_lazy_load "nvim-lspconfig"
--         -- reload the current file so lsp actually starts for it
--         vim.defer_fn(function()
--            vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
--         end, 0)
--      end,
--      config = function()
--         require "plugins.configs.lspconfig"
--      end,
--   },
--
--   ["ray-x/lsp_signature.nvim"] = {
--      after = "nvim-lspconfig",
--      config = function()
--         require("plugins.configs.others").signature()
--      end,
--   },
--
--   ["andymass/vim-matchup"] = {
--      opt = true,
--      setup = function()
--         require("core.utils").packer_lazy_load "vim-matchup"
--      end,
--   },
--
--   ["max397574/better-escape.nvim"] = {
--      event = "InsertCharPre",
--      config = function()
--         require("plugins.configs.others").better_escape()
--      end,
--   },
--
--   -- load luasnips + cmp related in insert mode only
--
--   ["rafamadriz/friendly-snippets"] = {
--      module = "cmp_nvim_lsp",
--      event = "InsertEnter",
--   },
--
--   ["hrsh7th/nvim-cmp"] = {
--      after = "friendly-snippets",
--      config = function()
--         require "plugins.configs.cmp"
--      end,
--   },
--
--   ["L3MON4D3/LuaSnip"] = {
--      wants = "friendly-snippets",
--      after = "nvim-cmp",
--      config = function()
--         require("plugins.configs.others").luasnip()
--      end,
--   },
--
--   ["saadparwaiz1/cmp_luasnip"] = {
--      after = "LuaSnip",
--   },
--
--   ["hrsh7th/cmp-nvim-lua"] = {
--      after = "cmp_luasnip",
--   },
--
--   ["hrsh7th/cmp-nvim-lsp"] = {
--      after = "cmp-nvim-lua",
--   },
--
--   ["hrsh7th/cmp-buffer"] = {
--      after = "cmp-nvim-lsp",
--   },
--
--   ["hrsh7th/cmp-path"] = {
--      after = "cmp-buffer",
--   },
--
--   -- misc plugins
--   ["windwp/nvim-autopairs"] = {
--      after = "nvim-cmp",
--      config = function()
--         require("plugins.configs.others").autopairs()
--      end,
--   },
--
--   ["goolord/alpha-nvim"] = {
--      disable = true,
--      config = function()
--         require "plugins.configs.alpha"
--      end,
--   },
--
--   ["numToStr/Comment.nvim"] = {
--      module = "Comment",
--      keys = { "gcc" },
--
--      setup = function()
--         require("core.mappings").comment()
--      end,
--
--      config = function()
--         require("plugins.configs.others").comment()
--      end,
--   },
--
--   -- file managing , picker etc
--  ["kyazdani42/nvim-tree.lua"] = {
--     cmd = { "NvimTreeToggle", "NvimTreeFocus" },
-- 
--     setup = function()
--        require("core.mappings").nvimtree()
--     end,
-- 
--     config = function()
--        require "plugins.configs.nvimtree"
--     end,
--  },
--
--   ["nvim-telescope/telescope.nvim"] = {
--      module = "telescope",
--      cmd = "Telescope",
--
--      setup = function()
--         require("core.mappings").telescope()
--      end,
--
--      config = function()
--         require "plugins.configs.telescope"
--      end,
--   },
--}

-- merge user plugin table & default plugin table
--plugins = require("core.utils").plugin_list(plugins)
--
--return packer.startup(function(use)
--   for _, v in pairs(plugins) do
--      use(v)
--   end
--end)


--  -- Simple plugins can be specified as strings
--  use '9mm/vim-closer'
--
--  -- Lazy loading:
--  -- Load on specific commands
--  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
--
--  -- Load on an autocommand event
--  use {'andymass/vim-matchup', event = 'VimEnter'}
--
--  -- Load on a combination of conditions: specific filetypes or commands
--  -- Also run code after load (see the "config" key)
--  use {
--    'w0rp/ale',
--    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
--    cmd = 'ALEEnable',
--    config = 'vim.cmd[[ALEEnable]]'
--  }
--
--  -- Plugins can have dependencies on other plugins
--  use {
--    'haorenW1025/completion-nvim',
--    opt = true,
--    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
--  }
--
--  -- Plugins can also depend on rocks from luarocks.org:
--  use {
--    'my/supercoolplugin',
--    rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
--  }
--
--  -- You can specify rocks in isolation
--  use_rocks 'penlight'
--  use_rocks {'lua-resty-http', 'lpeg'}
--
--  -- Local plugins can be included
--  use '~/projects/personal/hover.nvim'
--
--  -- Plugins can have post-install/update hooks
--  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
--
--  -- Post-install/update hook with neovim command
--  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
--
--  -- Post-install/update hook with call of vimscript function with argument
--  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
--
--  -- Use specific branch, dependency and run lua file after load
--  use {
--    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
--    requires = {'kyazdani42/nvim-web-devicons'}
--  }
--
--  -- Use dependency and run lua function after load
--  use {
--    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
--    config = function() require('gitsigns').setup() end
--  }
--
--  -- You can specify multiple plugins in a single call
--  use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
--
--  -- You can alias plugin names
--  use {'dracula/vim', as = 'dracula'}
--
