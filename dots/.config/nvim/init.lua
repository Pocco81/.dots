local ok, _ = pcall(require, 'impatient')

if not ok then
	vim.notify('Warning: impatient.nvim not installed', vim.log.levels.WARN)
end

_G.Cfg = {
		disabled_builtin_tools = {
			"netrw",
			"netrwPlugin",
			"netrwSettings",
			"netrwFileHandlers",
			"gzip",
			"zip",
			"zipPlugin",
			"tar",
			"tarPlugin",
			"getscript",
			"getscriptPlugin",
			"vimball",
			"vimballPlugin",
			"2html_plugin",
			"logipat",
			"matchit",
			"rrhelper",
			"spellfile_plugin",
		},
		globals = {
			mapleader = " ",
			did_load_filetypes = 1
		},
		global_options = {
			t_Co = "256",
			pumheight = 10, -- pop up menu height
			fileencoding = "utf-8", -- the encoding written to a file
			conceallevel = 0, -- so that `` is visible in markdown files
		},
		options = {
			inccommand = "split",
			encoding = "UTF-8",
			colorcolumn = "99999", -- fixes indentline for now
			splitbelow = true, -- force all horizontal splits to go below current window
			splitright = true, -- force all vertical splits to go to the right of current window
			updatetime = 300, -- faster completion
			clipboard = "unnamedplus", -- allows neovim to access the system clipboard
			backup = false, -- creates a backup file
			writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
			guicursor = { "i-c-ci:ver25", "o-v-ve:hor20", "cr-sm-n-r:block" },
			backspace = { "indent", "eol", "start" }, -- table
			iskeyword = { "-" },
			shortmess = { c = true, I = true, s = true }, -- no ins-completion-menu (c), intro (I) or "search hit BOTTOM, continuing at TOP" messages
			listchars = [[tab:› ,trail:•,extends:#,nbsp:.]], -- table
			matchpairs = { "<:>" }, --table insert
			termguicolors = true, -- set term gui colors (most terminals support this)
			errorbells = false,
			swapfile = false, -- creates a swapfile
			shell = "bash",
			cmdheight = 1, -- more space in the neovim command line for displaying messages
			signcolumn = "no", -- always show the sign column, otherwise it would shift the text each time
			tabstop = 4, -- insert 2 spaces for a tab
			shiftwidth = 4, -- the number of spaces inserted for each indentation
			softtabstop = 4,
			list = true,
			wrap = false, -- display lines as one long line
			showcmd = true,
			showmode = false, -- we don't need to see things like -- INSERT -- anymore
			mouse = "a", -- allow the mouse to be used in neovim
			mousemodel = "popup", -- Sets the model to use for the mouse.  The name mostly specifies what the right mouse button is used for:
			number = true, -- set numbered lines
			relativenumber = false, -- set relative numbered lines
			numberwidth = 4, -- set number column width to 2 {default 4}
			lazyredraw = true,
			scrolloff = 8, -- is one of my fav
			modelines = 0,
			hidden = true, -- required to keep multiple buffers and open multiple buffers
			ttyfast = true,
			hlsearch = true,
			incsearch = true,
			ignorecase = true,
			smartcase = true,
			ruler = true,
			cursorline = true, -- highlight the current line
			cursorcolumn = false,
			foldmethod = "syntax",
			foldenable = false,
			foldlevel = 99,
			cul = true,
			-- showtabline = 2, -- always show tabs
		}
}


_G.Act = {
	mappings = {
		-- syntax: {<vim_mode>, <keybinding>, <command>, <opts>}

		-- general
		{ "n", "<C-a>", [[<Cmd> %y+<CR>]], { noremap = true, silent = true } },
		-- better window movement
		{ "n", "<C-S-Left>", "<C-w>h", { silent = true } },
		{ "n", "<C-S-Down>", "<C-w>j", { silent = true } },
		{ "n", "<C-S-Up>", "<C-w>k", { silent = true } },
		{ "n", "<C-S-Right>", "<C-w>l", { silent = true } },
		-- resize windows
		{ "n", "<A-j>", ":resize -2<CR>", { silent = true } },
		{ "n", "<A-k>", ":resize +2<CR>", { silent = true } },
		{ "n", "<A-l>", ":vertical resize -2<CR>", { silent = true } },
		{ "n", "<A-h>", ":vertical resize +2<CR>", { silent = true } },
		-- open term over right
		{ "n", "<C-A-t>", [[<Cmd>vnew term://bash <CR>]], { noremap = true, silent = true } },
		{ "n", "<C-x>", [[<Cmd> split term://bash | resize 10 <CR>]], { noremap = true, silent = true } },
		-- indentate text
		{ "v", "<", "<gv", { noremap = true, silent = true } },
		{ "v", ">", ">gv", { noremap = true, silent = true } },
		-- ctrl+backspace to delete word
		{ "i", "<C-BS>", "<C-w>", { noremap = true, silent = true } },
		{ "i", "<C-h>", "<C-w>", { noremap = true, silent = true } },
		-- nvimtree
		{ "n", "<C-d>", ":NvimTreeToggle<CR>", { noremap = true, silent = true } },
		-- bufferline
		{ "n", "<PageUp>", [[<Cmd>BufferLineCycleNext<CR>]], { silent = true } },
		{ "n", "<PageDown>", [[<Cmd>BufferLineCyclePrev<CR>]], { silent = true } },
		{ "i", "<PageUp>", [[<Cmd>BufferLineCycleNext<CR>]], { silent = true } },
		{ "i", "<PageDown>", [[<Cmd>BufferLineCyclePrev<CR>]], { silent = true } },
		{ "n", "<C-PageUp>", [[<Cmd>BufferLineMoveNext<CR>]], { silent = true } },
		{ "n", "<C-PageDown>", [[<Cmd>BufferLineMovePrev<CR>]], { silent = true } },
		{ "n", "<S-b>", ":New ", { silent = true } },
		{ "n", "<S-e>", [[<Cmd>BufferLinePick<CR>]], { silent = true } },
		{ "n", "<leader>bd", [[<Cmd>BufferLineSortByDirectory<CR>]], { silent = true } },
		{ "n", "<leader>bl", [[<Cmd>BufferLineSortByExtension<CR>]], { silent = true } },
		{ "n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { silent = true } },
		{ "n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { silent = true } },
		{ "n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { silent = true } },
		{ "n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { silent = true } },
		{ "n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { silent = true } },
		{ "n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { silent = true } },
		{ "n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { silent = true } },
		{ "n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { silent = true } },
		{ "n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { silent = true } },
		-- close buffers
		{ "n", "<A-q>", [[:Bdelete this<CR>]], { noremap = true, silent = true } },
		-- autopairs
		{ "i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true } },
		-- undotree
		{ "n", "<leader>ut", ":UndotreeToggle<CR>", { noremap = true, silent = true } },
		-- tagbar
		{ "n", "<A-w>", "TagbarToggle<CR>", { noremap = true, silent = true } },
		-- highstr
		{ "v", "<leader>h", ":<c-u>HSHighlight<CR>", { noremap = true, silent = true } },
		{ "v", "<leader>n", ":<c-u>HSRmHighlight<CR>", { noremap = true, silent = true } },
		-- truezen
		{ "n", "<leader>zz", ":TZAtaraxis<CR>", { silent = true } },
		{ "n", "<leader>zm", ":TZMinimalist<CR>", { silent = true } },
		{ "n", "<leader>zf", ":TZFocus<CR>", { silent = true } },
		-- luasnip
		{
			"i",
			"<C-s>",
			[[<Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ]],
			{ silent = true, expr = true },
		},
		{ "s", "<C-s>", [[<cmd>lua require('luasnip').jump(1)<Cr>]], { silent = true } },
		{ "i", "<C-e>", [[<cmd>lua require'luasnip'.jump(-1)<Cr>]], { silent = true, noremap = true } },
		{ "s", "<C-e>", [[<cmd>lua require('luasnip').jump(-1)<Cr>]], { silent = true, noremap = true } },
		-- neoformat
		{ "n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], { silent = true } },
		-- sessions
		-- {"n", "<Leader>sl", [[<Cmd> SessionLoad<CR>]], {silent = true}},
		-- {"n", "<Leader>ss", [[<Cmd> SessionSave<CR>]], {silent = true}},
		-- telescope
		{ "n", "<Leader>gt", [[<Cmd> Telescope git_status <CR>]], { silent = true } },
		{ "n", "<Leader>cm", [[<Cmd> Telescope git_commits <CR>]], { silent = true } },
		{ "n", "<Leader>ff", [[<Cmd> Telescope find_files <CR>]], { silent = true } },
		{ "n", "<Leader>fb", [[<Cmd>Telescope buffers<CR>]], { silent = true } },
		{ "n", "<Leader>fh", [[<Cmd>Telescope help_tags<CR>]], { silent = true } },
		{ "n", "<Leader>fo", [[<Cmd>Telescope oldfiles<CR>]], { silent = true } },
		-- colorizer
		{ "n", "<Leader>cl", [[<Cmd>ColorizerReloadAllBuffers<CR>]], { silent = true } },
		-- lspsaga
		{ "n", "<Leader>sdc", [[<Cmd>Lspsaga show_cursor_diagnostics<CR>]], { silent = true } },
		{ "n", "<Leader>sdl", [[<Cmd>Lspsaga show_line_diagnostics<CR>]], { silent = true } },
		{ "n", "<Leader>sr", [[<Cmd>Lspsaga diagnostic_jump_next<CR>]], { silent = true } },
		{ "n", "<Leader>se", [[<Cmd>Lspsaga diagnostic_jump_prev<CR>]], { silent = true } },
		{ "n", "<Leader>sp", [[<Cmd>Lspsaga preview_definition<CR>]], { silent = true } },
		{ "n", "<Leader>sr", [[<Cmd>Lspsaga rename<CR>]], { silent = true } },
		{ "n", "<Leader>sa", [[<Cmd>Lspsaga code_action<CR>]], { silent = true } },
		{ "n", "<Leader>sf", [[<Cmd>Lspsaga lsp_finder<CR>]], { silent = true } },
		{ "n", "<Leader>si", [[<Cmd>Lspsaga implement<CR>]], { silent = true } },
		{ "n", "<Leader>ss", [[<Cmd>Lspsaga signature_help<CR>]], { silent = true } },
		{ "n", "<Leader>sh", [[<Cmd>Lspsaga hover_doc<CR>]], { silent = true } },
		-- native lsp
		{ "n", "<Leader>la", [[<Cmd>LspStart<CR>]], { silent = true } },
		{ "n", "<Leader>ls", [[<Cmd>LspStop<CR>]], { silent = true } },
		{ "n", "<Leader>lr", [[<Cmd>LspRestart<CR>]], { silent = true } },
		{ "n", "<Leader>li", [[<Cmd>LspInfo<CR>]], { silent = true } },
		-- clipboard
		{ "n", "<F5>", [[<Cmd>%y+<CR>]], { silent = true } },
	},
	abbreviations = {
		-- syntax: {<abbreviation_type>, <abbreviation>, <to_abbreviate>}

		{ "cnoreabbrev", "W", "w" },
		{ "cnoreabbrev", "Q", "q" },
		{ "cnoreabbrev", "Wq", "wq" },
		{ "cnoreabbrev", "Wqq", "wq" },
		{ "cnoreabbrev", "WQ", "wq" },
		{ "cnoreabbrev", "wQ", "wq" },
	},
	autocmds = {
		-- syntax: {<event>, <pattern>, <command>}

		_general = {
			{ "VimLeave", "*", "set guicursor=a:ver24" }, -- use if on tmux
			-- { "InsertCharPre", "*", [[PackerLoad cmp_luasnip]] }, -- use if on tmux
			-- { "InsertCharPre", "*", [[lua require("luasnip/loaders/from_vscode").load()]] }
		},
		_dashboard = {
			{ "FileType", "dashboard", "nnoremap <silent> <buffer> q :q<CR>" },
			{
				"FileType",
				"dashboard",
				"setlocal showtabline=0 laststatus=0 nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= ",
			},
		},
		-- _markdown = { -- this will enable wrap on MD files
		-- 	{ "FileType", "markdown", "setlocal wrap spell" },
		-- },
		_lsp = {
			{ "FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>" },
		},
		_text = {
			{ "FileType", "text", "setlocal wrap spell" },
		},
	},
	highlights = {
		-- syntax: {<group>, <guifg>, <guibg>, <ctermfg>, <ctermbg>, <attr>, <guisp>}

		{ "Conditional", nil, nil, nil, nil, "italic", nil },
		{ "Character", nil, nil, nil, nil, "undercurl", nil },
		{ "SpecialChar", nil, nil, nil, nil, "underline", nil },
		{ "Repeat", nil, nil, nil, nil, "italic", nil },
		{ "Function", nil, nil, nil, nil, "italic", nil },
		{ "Float", nil, nil, nil, nil, "bold", nil },
		-- {"CursorLine", nil, "#18232e", nil, nil, nil, nil}
	},
}

require("core.settings")
require("plugins")
require("core.actions")
