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
	q = {"Harpoon file 1"},
	w = {"Harpoon file 2"},
	e = {"Harpoon file 3"},
	r = {"Harpoon file 4"},
	b = {"Browse Files (netrw)"},
	s = {"Grep Search (Telescope)"},
	h = { name = "Harpoon", m = {"Harpoon Menu Toggle"}, a = {"Harpoon Add File"} },
	f = { name = "Telescope", f = {"Telescope Find File"}, g = {"Telescope Find Git File"} }
}, { prefix = "<leader>" })
