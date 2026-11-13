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
        -- UndoTree
        {
            "jiaoshijie/undotree",
            opts = {
                -- your options
            },
        },
        -- WhichKey...
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
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
        -- Visual enhancements
        {
            "neanias/everforest-nvim",
            version = false,
            lazy = false,
            priority = 1, -- make sure to load this before all the other start plugins
            -- Optional; default configuration will be used if setup isn't called.
            config = function()
                require("everforest").setup({
                    -- Your config here
                })
            end,
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
