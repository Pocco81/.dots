require "lspconfig"["lua"].setup {
    on_attach = require("plugins.lsp.attachments").common,
    capabilities = require("plugins.lsp.capabilities").lua(),
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
                checkThirdParty = false
            },
            telemetry = {
                enable = false
            }
        }
    }
}
