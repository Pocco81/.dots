local present, gitsigns = pcall(require, "gitsigns")
if not present then
	return
end

gitsigns.setup({
	keymaps = {
		-- Default keymap options
		buffer = true,
		noremap = true,
		["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
		["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
		["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
	},
	numhl = false,
	sign_priority = 5,
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},

	status_formatter = nil, -- Use default
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	-- signs = {
	-- 	add = { text = "+" },
	-- 	change = { text = "~" },
	-- 	delete = { text = "_" },
	-- 	topdelete = { text = "‾" },
	-- 	changedelete = { text = "~" },
	-- },
})
