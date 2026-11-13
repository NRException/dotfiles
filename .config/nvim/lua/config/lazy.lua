-- Bootstrap lazy.nvim
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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.fillchars = {eob = " "}

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
	{
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
	},
    {
        "nvim-telescope/telescope-live-grep-args.nvim", 
        dependencies = {'nvim-telescope/telescope.nvim'}
    },
	{
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",

	},
    --LSP Zero (VonHeikemen/lsp-zero.nvim) and Mason
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp', event = { "InsertEnter", "CmdlineEnter" },},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/cmp-buffer'},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},

    --Session handler, works with tmux to restore vim session data
    {
        'rmagatti/auto-session',
        lazy = false,
        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        }
    },

    -- Harpoon 2 ( Cheers Prime :) )
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Oil / netrw replacement...
    {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    },

    -- WhichKey...
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },

    -- Sorting...
    {
        'sQVe/sort.nvim',
        config = function()
            require('sort').setup({
                -- Optional configuration overrides.
            })
        end,
    },

    -- Markdown rendering...
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        opts = {},
    },

    --Pretty Stuff...
    {
		'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
		opts = {
			style = 'night',
            on_colors = function(colors)
                colors.bg_statusline = colors.none -- or "NONE"
            end,
		},
	},
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },
    {'xiyaowong/transparent.nvim', lazy=false},
    {'lewis6991/gitsigns.nvim'},
    {'nvim-tree/nvim-web-devicons'},
  },


  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
