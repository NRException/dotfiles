local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Telescope [F]ind [F]ile"})
vim.keymap.set('n', '<leader>fr', builtin.git_files, {desc = "Telescope [F]ind [R]epo"})
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {desc = "Telescope [F]ind [G]rep"})
