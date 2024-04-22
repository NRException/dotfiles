print("Loading NRException profile...")
require("nrexception.remap")
require("nrexception.packer")

-- Add relative line numbers and remove ugly vim fill chars.
vim.wo.relativenumber = true
vim.opt.fillchars = {eob = " "}

-- Add custom options...
vim.opt.guicursor = "" -- Enables <FAT> cursor :P
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = true
	-- enables long running undos by providing a file to dump undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
