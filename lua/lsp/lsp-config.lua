-- Mason and Mason-LSPConfig setup
require("mason").setup()
require("mason-lspconfig").setup()

-- Setup individual LSP servers via lspconfig
local lspconfig = require("lspconfig")
local capabilities = require('blink.cmp').get_lsp_capabilities()


-- Example: Lua language server setup
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' } -- Recognize 'vim' as a global variable
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
            },
            telemetry = {
                enable = false, -- Disable telemetry for privacy
            },
        },
    },
    capabilities = capabilities
})


-- python
lspconfig.pylsp.setup {
    capabilities = capabilities,
}

-- bash
lspconfig.bashls.setup {
    capabilities = capabilities,
}

vim.diagnostic.config({
    update_in_insert = true, -- Enable diagnostics while typing in insert mode
    virtual_text = {
        source = "always", -- Show the source of the diagnostic
        prefix = "●", -- Use a custom prefix for virtual text
    },
    signs = true, -- Show signs in the gutter
    underline = true, -- Underline diagnostics
    severity_sort = true, -- Sort diagnostics by severity
})
