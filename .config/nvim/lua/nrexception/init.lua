print("Loading NRException profile...")
require("nrexception.remap")
require("nrexception.packer")

vim.cmd('colorscheme rose-pine')

-- Add relative line numbers and remove ugly vim fill chars.
vim.wo.relativenumber = true
vim.opt.fillchars = {eob = " "}
