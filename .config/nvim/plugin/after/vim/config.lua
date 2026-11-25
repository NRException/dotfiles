-- Vim custom keymaps...
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


vim.keymap.set("n", "<leader>l", show_hide_special_chars, { desc = "Show special characters" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
vim.keymap.set("n", "<C-Down>", ":move +1<CR>==", { desc = "Move current line down" })
vim.keymap.set("n", "<C-Up>", ":move -2<CR>==", { desc = "Move current line up" })
vim.keymap.set("x", "<C-Down>", ":move '>+1<CR>gv=gv", { desc = "Move selected block down" })
vim.keymap.set("x", "<C-Up>", ":move '<-2<CR>gv=gv", { desc = "Move selected block up" })

-- Vim custom options

vim.cmd("set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<")
vim.wo.relativenumber = true -- Add relative line numbers and remove ugly vim fill chars.
vim.opt.number = true
vim.opt.fillchars = {eob = " "}
vim.opt.guicursor = "" -- Enables <FAT> cursor :P
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- enables long running undos by providing a file to dump undo history
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 5
vim.g.clipboard = {
  name = 'WslClipboard',
  copy = {
    ['+'] = 'clip.exe',
    ['*'] = 'clip.exe',
  },
  paste = {
    ['+'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ['*'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

-- Quickfix list simple bindings...
Del_qf_item = function()
  local items = vim.fn.getqflist()
  local line = vim.fn.line('.')
  table.remove(items, line)
  vim.fn.setqflist(items, "r")
  vim.api.nvim_win_set_cursor(0, { line-1, 0 })
end
local group = vim.api.nvim_create_augroup("quickfix_autocmds", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  group = group,
  callback = function()
    vim.cmd "set cursorline"
    vim.cmd "hi CursorLine term=bold cterm=bold guibg=Grey40"
    vim.cmd "hi QuickFixLine term=bold cterm=bold guibg=Grey40"
    vim.api.nvim_buf_set_keymap(0, "n", "<Up>", "<Up><CR><C-w>p", { noremap = true, desc = "Navigate up [c]uickfix" })
    vim.api.nvim_buf_set_keymap(0, "n", "<Down>", "<Down><CR><C-w>p", { noremap = true, desc = "Navigate down [c]uickfix" })
    vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>cclose | quit<CR>", {noremap = true, silent = true, desc = "Close [c]uickfix"})
    vim.api.nvim_buf_set_keymap(0, "n", "dd", "<cmd> lua Del_qf_item() <CR>", { noremap = true, silent = true, desc = "Remove entry from QF" })
  end,
})

-- LSP adjacent stuff
vim.opt.signcolumn = 'yes'
vim.diagnostic.config({
    virtual_lines = false,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})
