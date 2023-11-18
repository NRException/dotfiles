local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
	name = "Leader Main",
	u = {"UndoTree Menu Toggle"},
	b = {"Browse Files (netrw)"},
	h = { name = "Harpoon", m = {"Harpoon Menu Toggle"}, a = {"Harpoon Add File"} },
	f = { name = "Telescope", f = {"Telescope Find File"}, g = {"Telescope Find Git File"}, s = {"Telescope Live Grep"} } 
}, { prefix = "<leader>" })
