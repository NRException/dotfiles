-- telescope global config
local ts = require('telescope')
ts.setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

-- telescope keybind mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope [F]ind [F]ile" })
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep_args<CR>", { desc = "Telescope [F]ind [G]rep" })
vim.keymap.set('n', '<leader>gb', ":Telescope git_branches<CR>", { desc = "Telescope [G]ind [B]ranches" })
vim.keymap.set('n', '<leader>gc', ":Telescope git_commits<CR>", { desc = "Telescope [G]it [C]ommits" })
vim.keymap.set('n', '<leader>gs', ":Telescope git_status<CR>", { desc = "Telescope [G]it [S]status" })
