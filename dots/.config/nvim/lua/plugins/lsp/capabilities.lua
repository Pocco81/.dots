local M = {}

function M.common()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	return capabilities
end

---Make capabilities and return them
---@param with_snippets boolean
---@param use_cmp boolean
---@return table
function M.get_capabilities(with_snippets, use_cmp)
	with_snippets = with_snippets or false
	use_cmp = use_cmp or true
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = with_snippets
	if with_snippets then
		capabilities.textDocument.completion.completionItem.resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		}
	end
	if use_cmp then
		return require("cmp_nvim_lsp").update_capabilities(capabilities)
	else
		return capabilities
	end
end

function M.lua()
	local capabilities = M.common()
	capabilities.textDocument.completion.completionItem.resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	}
	return capabilities
end

return M
