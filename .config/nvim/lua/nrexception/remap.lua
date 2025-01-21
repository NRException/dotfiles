-- Map keys for vim builtin
vim.g.mapleader = " "

vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Half page down"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Half page up"})

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

vim.keymap.set("n", "<leader>l", show_hide_special_chars, {desc = "Show special characters"})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {desc = "Show diagnostic info"})

vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, {desc = "Show module info"})
-- Map keys for anything else (plugins etc...)

-- Oil
vim.keymap.set("n", "<leader>b", "<CMD>Oil<CR>", { desc = "Open oil" })
