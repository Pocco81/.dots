local present, bufresize = pcall(require, "bufresize")
if not present then
	return
end

local opts = { noremap = true, silent = true }
bufresize.setup({
	register = {
		keys = {
			{ "n", "<leader>w<", "30<C-w><", opts },
			{ "n", "<leader>w>", "30<C-w>>", opts },
			{ "n", "<leader>w+", "10<C-w>+", opts },
			{ "n", "<leader>w-", "10<C-w>-", opts },
			{ "n", "<leader>w_", "<C-w>_", opts },
			{ "n", "<leader>w=", "<C-w>=", opts },
			{ "n", "<leader>w|", "<C-w>|", opts },
			{ "n", "<leader>wo", "<C-w>|<C-w>_", opts },
		},
		trigger_events = { "BufWinEnter", "WinEnter", "VimResized" },
	},
	resize = {
		keys = {},
		trigger_events = { "VimResized", "VimLeave", "VimResume" },
	},
})
