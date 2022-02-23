local cmd = vim.cmd

local function map_augroup_autocmds(augroup, group_name)
		group_name = group_name or "default_nvdope_group_name"

        cmd('augroup ' .. group_name)
        cmd('autocmd!')

		for autocmd, _ in pairs(augroup) do
			local au = augroup[autocmd]
			cmd([[autocmd ]] .. au[1] .. [[ ]] .. au[2] .. [[ ]] .. au[3])
		end

        cmd('augroup END')
end

local function map_abbreviation(type, abbrev, replace)
	cmd(type .. [[ ]] .. abbrev .. [[ ]] .. replace)
end

local function hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
	local parts = {group}
	if guifg then table.insert(parts, "guifg="..guifg) end
	if guibg then table.insert(parts, "guibg="..guibg) end
	if ctermfg then table.insert(parts, "ctermfg="..ctermfg) end
	if ctermbg then table.insert(parts, "ctermbg="..ctermbg) end
	if attr then
		table.insert(parts, "gui="..attr)
		table.insert(parts, "cterm="..attr)
	end
	if guisp then table.insert(parts, "guisp="..guisp) end

	cmd('highlight '..table.concat(parts, ' '))
end

for mapping, _ in pairs(Act.mappings) do
	local mp = Act.mappings[mapping]
    vim.api.nvim_set_keymap(mp[1], mp[2], mp[3], mp[4])
    -- vim.api.nvim_set_keymap(mode, keybinding, cmd, opts)
end

for autocmd_category, _ in pairs(Act.autocmds) do
	if not (next(Act.autocmds[autocmd_category]) == nil) then
		map_augroup_autocmds(Act.autocmds[autocmd_category], autocmd_category)
	end
end

for abbrev, _ in pairs(Act.abbreviations) do
	local abb = Act.abbreviations[abbrev]
	map_abbreviation(abb[1], abb[2], abb[3])
end


for highlight, vals in pairs(Act.highlights) do
	hi(vals[1], vals[2], vals[3], vals[4], vals[5], vals[6], vals[7])
end
