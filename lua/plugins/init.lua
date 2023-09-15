return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"gbprod/cutlass.nvim",
		config = function()
			require("cutlass").setup({
				cut_key = "x",
			})
		end,
	})

	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugins.configs.nvim-tree")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("plugins.configs.telescope")
		end,
	})

	use({
		"neovim/nvim-lspconfig",
		requires = { { "hrsh7th/cmp-nvim-lsp" } },
		config = function()
			require("plugins.configs.lspconfig")
		end,
	})

	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.configs.cmp")
		end,
	})
	use("saadparwaiz1/cmp_luasnip")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("plugins.configs.treesitter")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.configs.indent-blankline")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.configs.gitsigns")
		end,
	})

	use({
		"ur4ltz/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "sandwich" })
		end,
	})

	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("plugins.configs.hop")
		end,
	})
	use({
		"L3MON4D3/LuaSnip",
		requires = {
			"rafamadriz/friendly-snippets",
		},
		tag = "v2.*",
		config = function()
			require("plugins.configs.luasnip")
		end,
	})

	use({ "jose-elias-alvarez/null-ls.nvim" })

	use({
		"startup-nvim/startup.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.configs.startup")
		end,
	})

	use({
		"feline-nvim/feline.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("plugins.configs.feline")
		end,
	})

	use({
		"folke/which-key.nvim",
	})
end)
