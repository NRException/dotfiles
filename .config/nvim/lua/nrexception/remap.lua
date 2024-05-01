-- Map keys for vim builtin
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

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

vim.keymap.set("n", "<leader>l", show_hide_special_chars)
