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

-- Add custom options...
vim.wo.relativenumber = true -- Add relative line numbers and remove ugly vim fill chars.
vim.opt.number = true
vim.opt.fillchars = {eob = " "}
vim.opt.guicursor = "" -- Enables <FAT> cursor :P
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- enables long running undos by providing a file to dump undo history
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 5

-- Vim custom keymaps...
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
vim.cmd("set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<")
local list_flop = false
local function show_hide_special_chars()
    if list_flop == true then
        list_flop = false
        vim.cmd("set list")
        print("Showing special chars...")
    else
        list_flop = true
        vim.cmd("set nolist")
        print("Hiding special chars...")
    end
end
vim.keymap.set("n", "<leader>l", show_hide_special_chars, { desc = "Show special characters" })
vim.keymap.set("n", "<leader>b", "<CMD>Oil<CR>", { desc = "Open oil" })

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
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},

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
