-- Vim custom keymaps...

local list_flop = false
local function show_hide_special_chars()
    if list_flop == true then
        list_flop = false
        vim.cmd("set list")
    else
        list_flop = true
        vim.cmd("set nolist")
    end
end

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
vim.keymap.set("n", "<leader>ts", show_hide_special_chars, { desc = "Toggle special characters" })
vim.keymap.set("n", "<leader>b", "<CMD>Oil<CR>", { desc = "Open oil" })
vim.keymap.set("n", "<C-Down>", ":move +1<CR>==", { desc = "Move current line down" })
vim.keymap.set("n", "<C-Up>", ":move -2<CR>==", { desc = "Move current line up" })
vim.keymap.set("x", "<C-Down>", ":move '>+1<CR>gv=gv", { desc = "Move selected block down" })
vim.keymap.set("x", "<C-Up>", ":move '<-2<CR>gv=gv", { desc = "Move selected block up" })
