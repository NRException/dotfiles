local highlight = {
    "a",
    "b"
}

local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "a", { fg = "#D3C6AA" })
    vim.api.nvim_set_hl(0, "b", { fg = "#A7C080" })
end)

local toggled = false
local function toggle_ibl()
    if toggled == true then
        toggled = false
        require("ibl").setup {
            indent = { highlight = highlight,char="" },
            whitespace = {
                highlight = highlight,
                remove_blankline_trail = true
            },
            scope = { enabled = false },
        }
    else
        toggled = true
        require("ibl").setup {
            indent = { highlight = highlight,char="┊" },
            whitespace = {
                highlight = highlight,
                remove_blankline_trail = true
            },
            scope = { enabled = false },
        }
    end
end

require("ibl").setup {
    indent = { highlight = highlight,char="" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = true
    },
    scope = { enabled = false },
}
vim.keymap.set("n", "<leader>ti", toggle_ibl, { desc = "Toggle indent highlighting" })
