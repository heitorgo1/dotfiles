-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	--
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"EdenEast/nightfox.nvim",
		as = "nightfox",
		config = function()
			vim.cmd("colorscheme nightfox")
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({
		"NeogitOrg/neogit",
		as = "neogit",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "sindrets/diffview.nvim" },
			{ "ibhagwan/fzf-luz" },
		},
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	})
	use({
		"windwp/nvim-autopairs",
	})
	use({
		"nvim-lualine/lualine.nvim",
		as = "lualine",
	})
	use({
		"lvimuser/lsp-inlayhints.nvim",
	})
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("christoomey/vim-tmux-navigator")
	use("tpope/vim-fugitive")
	use("nvim-tree/nvim-tree.lua")
	use("ryanoasis/vim-devicons")
	use("nvim-tree/nvim-web-devicons")
	use("mfussenegger/nvim-lint")
	use("airblade/vim-gitgutter")
	use("neovim/nvim-lspconfig")
	use({
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	})
	use({
		"SmiteshP/nvim-navbuddy",
		requires = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
	})
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use({
		"jay-babu/mason-nvim-dap.nvim",
	})
	use("leoluz/nvim-dap-go")
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = true,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
end)
