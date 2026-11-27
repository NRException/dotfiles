-- telescope global config
local ts = require('telescope')
ts.setup {
    defaults = {
        layout_strategy = "vertical",
        layout_config = {
            width = 0.90,
            height = 0.85,
            vertical = {
                preview_width = 0.55,
                preview_height = 0.75,
            },
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        }
    }
}

-- telescope keybind mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope [F]ind [F]ile" })
vim.keymap.set('n', '<leader>fi', ":Telescope live_grep_args<CR>", { desc = "Telescope [F]ind [I]nside (grep)" })
vim.keymap.set('n', '<leader>fb', ":Telescope git_branches<CR>", { desc = "Telescope [F]ind [B]ranches" })
vim.keymap.set('n', '<leader>fc', ":Telescope git_commits<CR>", { desc = "Telescope [F]ind [C]ommits" })
vim.keymap.set('n', '<leader>fs', ":Telescope git_status<CR>", { desc = "Telescope [F]ind [S]status" })
