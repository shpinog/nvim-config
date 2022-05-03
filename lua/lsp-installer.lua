require("nvim-lsp-installer").setup({
    ensure_installed = { "sumneko_lua", "rnix" }, -- ensure these servers are always installed
    automatic_installation = false, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local lspconfig = require('lspconfig')

lspconfig.sumneko_lua.setup {}
lspconfig.rnix.setup {}



-- local lsp_installer = require("nvim-lsp-installer")
-- lsp_installer.on_server_ready(function(server)
--     local opts = {}
--     if server.name == "sumneko_lua" then
--         -- only apply these settings for the "sumneko_lua" server
--         opts.settings = {
--             Lua = {
--
--                 diagnostics = {
--                     -- Get the language server to recognize the 'vim', 'use' global
--                     enable = true,
--                     globals = {'vim', 'use'},
--                     disale = "lowercase-global",
--                 },
--                 workspace = {
--                     -- Make the server aware of Neovim runtime files
--                     library = vim.api.nvim_get_runtime_file("", true),
--                 },
--                 -- Do not send telemetry data containing a randomized but unique identifier
--                 telemetry = {
--                     enable = false,
--                 },
--             },
--         }
--     end
--     server:setup(opts)
-- end)



-- local lsp = require "lspconfig"
-- local coq = require "coq"
--
-- lsp.tsserver.setup{}
-- lsp.tsserver.setup(coq.lsp_ensure_capabilities{})
