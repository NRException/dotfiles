-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  	-- Packer can manage itself
  	use 'wbthomason/packer.nvim'

	-- Telescope
	use {
  		'nvim-telescope/telescope.nvim', 
		tag = '0.1.4',
 	 	requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- LSP and treesitter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
	-- Status bar plugins
	use 'feline-nvim/feline.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'nvim-tree/nvim-web-devicons'

	-- Theme...
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	
	-- Undo Tree...
	use( 'mbbill/undotree' )

	-- Harpoon, TY Prime :)
	use( 'ThePrimeagen/harpoon' )

	-- Which Key
	use {
	  "folke/which-key.nvim",
	  config = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	    require("which-key").setup {
	      -- your configuration comes here
	      -- or leave it empty to use the default settings
	      -- refer to the configuration section below
	    }
	  end
	}
end)

