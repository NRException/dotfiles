local notes = require("notes")
notes.setup({root = os.getenv("HOME") .. "/notes/"})

vim.keymap.set("n", "<leader>nf", function() notes:find() end, {desc = "[N]otes [F]ind"})
vim.keymap.set("n", "<leader>ng", function() notes:grep() end, {desc = "[N]otes [G]rep"})
vim.keymap.set("n", "<leader>nn", function() notes:create() end, {desc = "[N]otes [N]ew"})
