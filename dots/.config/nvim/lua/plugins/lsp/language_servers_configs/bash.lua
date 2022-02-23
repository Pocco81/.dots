require "lspconfig"["bash"].setup {
	on_attach = require("plugins.lsp.attachments").common,
	capabilities = require("plugins.lsp.capabilities").common(),
	root_dir = vim.loop.cwd
}
