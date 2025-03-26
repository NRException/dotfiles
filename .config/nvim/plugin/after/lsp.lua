-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- Change how diagnostics are displayed... https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = {
        prefix = '',
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})
vim.keymap.set('n', 'gK', function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = 'Toggle virtual_lines' })

-- Set up LSP.
-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- Auto-completion setup using nvim-cmp
local cmp = require('cmp')


cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Down>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
        ['<Up>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
                fallback()
            end
        end),
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
                cmp.confirm()
            else
                fallback()
            end
        end, { "i", "s", "c", }),
    })
})

cmp.setup.cmdline(':', {
    --mapping = cmp.mapping.preset,
    mapping = cmp.mapping.preset.cmdline({
        ['<Down>'] = { c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }) },
        ['<Up>'] = { c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }) },
        ['<Tab>'] = { c = cmp.mapping.confirm(); },
    }),
    sources = cmp.config.sources({
        { name = 'cmdline' }
    }, {
        {name = 'path'}
    })
})


-- Attach LSP if one is available.
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
        local opts = {buffer = event.buf}
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil -- Disables semantic highlighting on successful LSP attach

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {desc = "Open diagnostic info", buffer = event.buf} )
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {desc = "Go to definition", buffer = event.buf})
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {desc = "Go to declaration", buffer = event.buf})
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {desc = "Go to implementation", buffer = event.buf})
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', {desc = "Go to type definition", buffer = event.buf})
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {desc = "Go to references", buffer = event.buf})
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {desc = "Get signature help", buffer = event.buf})
        vim.keymap.set("n", "<leader>d", '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = "Show diagnostics" })
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', {desc = "Rename Reference", buffer = event.buf})
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', {desc = "Format buffer", buffer = event.buf})
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', {desc = "Code action", buffer = event.buf})
  end,
})

-- LSP global overrides... For borders mostly...
local border = "single"
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Mason Config...
require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { 'lua_ls', 'rust_analyzer' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})

-- Specific LSP configuration...
require('lspconfig')['rust_analyzer'].setup {
    assist = {
        importGranularity = 'module',
        importPrefix = 'self',
    },
    diagnostics = {
        enable = true,
        enableExperimental = true,
    },
    cargo = {
        loadOutDirsFromCheck = true,
    },
    procMacro = {
        enable = true,
    },
    inlayHints = {
        chainingHints = true,
        parameterHints = true,
        typeHints = true,
    }
}
