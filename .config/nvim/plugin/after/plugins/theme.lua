require("tokyonight").setup {
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
    -- test
    on_colors = function(colors)
        colors.comment = "#d9d9d9"
    end,

    on_highlights = function(hl)
        hl.LineNrAbove = { fg = 'orange' }
        hl.LineNr = { fg = 'white' }
        hl.LineNrBelow = { fg = 'orange' }
    end,
}

vim.cmd("colorscheme tokyonight")
vim.cmd("TransparentEnable")
