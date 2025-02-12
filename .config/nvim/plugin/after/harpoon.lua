local harpoon = require('harpoon')
harpoon:setup({})

vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "[H]arpoon Menu"})
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add(); print("Added file to harpoon list.") end, {desc = "[H]arpoon Add"})
vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end, {desc = "Harpoon Previous File"})
vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end, {desc = "Harpoon Next File"})
