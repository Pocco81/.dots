local lspinstall = require("nvim-lsp-installer")

-- LSP installer
lspinstall.settings({
	ui = {
		icons = {
			server_installed = "",
			server_pending = "",
			server_uninstalled = "",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			uninstall_server = "r",
		},
	},
	install_root_dir = vim.fn.stdpath("data") .. "/lsp_servers/",
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
})

local function setup_handlers()
	-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- 	virtual_text = {
	-- 		-- prefix = "",
	-- 		prefix = "",
	-- 		spacing = 0,
	-- 	},
	-- 	underline = true,
	-- 	signs = true,
	-- 	update_in_insert = true,
	-- })
	vim.diagnostic.config({
		signs = true,
		underline = true,
		virtual_text = true,
		update_in_insert = true,
	})
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

local function setup_servers()
	lspinstall.on_server_ready(function(server)
		local default_opts = {
			on_attach = require("plugins.lsp.attachments").commmon,
			capabilities = require("plugins.lsp.capabilities").common(),
		}

		local server_opts = {
			["eslintls"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					settings = {
						format = {
							enable = true,
						},
					},
				})
			end,
			["yamlls"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					settings = {
						yaml = {
							hover = true,
							completion = true,
							validate = true,
						},
						redhat = {
							telemetry = {
								enabled = false,
							},
						},
					},
				})
			end,
			["jsonls"] = function()
				return default_opts
			end,
			["bashls"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					root_dir = vim.loop.cwd,
					filetypes = { "sh" },
				})
			end,
			["cssls"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					root_dir = vim.loop.cwd,
					filetypes = { "css", "scss", "less" },
					settings = {
						css = {
							validate = true,
						},
						less = {
							validate = true,
						},
						scss = {
							validate = true,
						},
					},
					single_file_support = true,
				})
			end,
			["cmake"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					-- root_dir = vim.loop.cwd,
					filetypes = { "cmake", "make" },
				})
			end,
			["ccls"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					filetypes = { "c", "cpp", "objc", "objcpp" },
					offset_encoding = "utf-32",
					single_file_support = true,
				})
			end,
			["clangd"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					filetypes = { "c", "cpp", "objc", "objcpp" },
					single_file_support = true,
				})
			end,
			["sumneko_lua"] = function()
				-- return require("lua-dev").setup({
				-- lspconfig = default_opts,
				-- })
				return vim.tbl_deep_extend("force", default_opts, {
					on_attach = require("plugins.lsp.attachments").common,
					capabilities = require("plugins.lsp.capabilities").lua(),
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
								},
								maxPreload = 100000,
								preloadFileSize = 10000,
								checkThirdParty = false,
							},
							telemetry = {
								enable = false,
							},
						},
					},
				})
			end,
			["efm"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					root_dir = vim.loop.cwd,
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
					settings = {
						rootMarkers = { ".git/" },
					},
				})
			end,
			["gopls"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					cmd = { "gopls" },
					filetypes = { "go", "gomod" },
				})
			end,
			["rust_analyzer"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					filetypes = { "rust" },
				})
			end,
			["pyright"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					filetypes = { "python" },
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "workspace",
								useLibraryCodeForTypes = true,
							},
						},
					},
					single_file_support = true,
				})
			end,
			["jdtls"] = function()
				return vim.tbl_deep_extend("force", default_opts, {
					filetypes = { "java" },
					single_file_support = true,
				})
			end,
		}

		server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
	end)
end

setup_handlers()
setup_servers()

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- suppress error messages from lang servers
-- vim.notify = function(msg, log_level, _opts)
-- 	if msg:match("exit code") then
-- 		return
-- 	end
-- 	if log_level == vim.log.levels.ERROR then
-- 		vim.api.nvim_err_writeln(msg)
-- 	else
-- 		vim.api.nvim_echo({ { msg } }, true, {})
-- 	end
-- end
