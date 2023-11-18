require("telescope").load_extension('harpoon')

require("harpoon").setup({  })

vim.keymap.set("n", "<leader>hm", function() require("harpoon.ui").toggle_quick_menu() end)
vim.keymap.set("n", "<leader>ha", function() require("harpoon.mark").add_file() end)
vim.keymap.set("n", "<leader>q", function() require("harpoon.ui").nav_file(1) end)
vim.keymap.set("n", "<leader>w", function() require("harpoon.ui").nav_file(2) end)
vim.keymap.set("n", "<leader>e", function() require("harpoon.ui").nav_file(3) end)
vim.keymap.set("n", "<leader>r", function() require("harpoon.ui").nav_file(4) end)
