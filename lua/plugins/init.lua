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

  --use {
  --  'whkelvin/nvim-base16',
  --  config = function()
  --    require('plugins.configs.nvim-base16')
  --  end,
  --}

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

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.configs.gitsigns')
    end,
  }

  use {
    'ur4ltz/surround.nvim',
    config = function()
      require('surround').setup { mappings_style = 'sandwich' }
    end,
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require('plugins.configs.hop')
    end,
  }

  use {
    'tversteeg/registers.nvim'
  }

  use({
    "gbprod/cutlass.nvim",
    config = function()
      require("cutlass").setup({
        cut_key = 'x',
      })
    end
  })


  use {'nvim-lua/plenary.nvim'}

  use {'jose-elias-alvarez/null-ls.nvim'}

end)
