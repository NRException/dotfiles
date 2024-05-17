require("oil").setup({
    -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
    -- set to false if you still want to use netrw.
    default_file_explorer = true,

    -- id is automatically added at the beginning, and name at the end
    -- see :help oil-columns
    columns = {
        "icon",
    },

    view_options = {
    -- Show files and directories that start with "."
        show_hidden = true,
    },

  })
