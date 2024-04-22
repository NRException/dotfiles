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
	q = {"Harpoon file 1"},
	w = {"Harpoon file 2"},
	e = {"Harpoon file 3"},
	r = {"Harpoon file 4"},
	b = {"Browse Files (netrw)"},
	h = { name = "Harpoon", m = {"Harpoon Menu Toggle"}, a = {"Harpoon Add File"} },
	f = { name = "Telescope", f = {"Telescope (F)ind File"}, g = {"Telescope Find Rip(G)rep"}, r = {"Telescope Find in (R)epo"} }
}, { prefix = "<leader>" })
