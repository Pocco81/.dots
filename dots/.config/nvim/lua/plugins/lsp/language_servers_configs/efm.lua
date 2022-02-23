require "lspconfig"["efm"].setup {
	on_attach = require("plugins.lsp.attachments").common,
	capabilities = require("plugins.lsp.capabilities").common(),
    filetypes = {
        "lua",
		-- "go", -- not recommended
        -- "python", -- not recommended
        -- "json", -- not recommended
        -- "javascriptreact",
        -- "javascript", -- maybbe?
        -- "typescript",
        -- "typescriptreact",
        "sh",
        "html",
        "css",
        "yaml",
        "markdown",
        -- "vue"
    },
}
