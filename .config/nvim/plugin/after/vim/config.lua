-- Add custom options...

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

vim.cmd("set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<")

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
