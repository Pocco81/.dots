local function load_packer()
	vim.cmd("packadd packer.nvim")
	return pcall(require, "packer")
end

local function get_packer()
	local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.notify("Error: Packer is missing! Installing it...", vim.log.levels.WARN)
		vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim --depth 20 " .. install_path)

		vim.cmd("packadd packer.nvim")
		present, packer = pcall(require, "packer")

		local present, packer = load_packer()
		if present then
			vim.notify("Success: Packer was installed", vim.log.levels.INFO)
			return packer
		else
			vim.notify("Failed to clone packer under " .. install_path, vim.log.levels.ERROR)
		end
	else
		local present, packer = load_packer()
		if present then
			return packer
		end
	end
end

local packer = get_packer()

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
		prompt_border = "single",
	},
	git = {
		clone_timeout = 600, -- Timeout, in seconds, for git clones
	},
	auto_clean = true,
	compile_on_sync = true,
	--    auto_reload_compiled = true
})

packer.startup(function(use)
	------------ Core
	use({
		"lewis6991/impatient.nvim",
		rocks = "mpack",
	})

	use({ "nathom/filetype.nvim" })
	use("wbthomason/packer.nvim") -- Package manager

	use({
		"nvim-lua/popup.nvim",
		after = "plenary.nvim",
		requires = { "nvim-lua/plenary.nvim" }
	})

	use({
		"nvim-lua/plenary.nvim",
		event = "BufRead"
	})

	------------ UI

	use({
		"kyazdani42/nvim-web-devicons",
		event = "VimEnter",
		commit = "c8ce86df2ee0f5bb455c4188c8a4c77d3c9ef714",
		config = function()
			require("plugins.ui.web_devicons")
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		after = "nvim-web-devicons",
		config = function()
			require("plugins.ui.bufferline")
		end,
	})

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		branch = "dev",
		after = "bufferline.nvim", -- becuase catppuccin overrides highlights and not the other way around
		config = function()
			require("plugins.ui.catppuccin")
		end,
	})

	use({
		"famiu/feline.nvim",
		after = "catppuccin",
		config = function()
			require("plugins.ui.feline")
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		commit = "a702f809ce85b16a83c44016bf10fe5a5765e98d",
		config = function()
			require("plugins.ui.indent_blankline")
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		after = "catppuccin",
		config = function()
			require("plugins.ui.colorizer")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require("plugins.ui.treesitter")
		end,
	})

	use({
		"nvim-treesitter/playground",
		after = "nvim-treesitter",
	})

	use({
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require("plugins.ui.tree")
		end
	})

	use({
		"glepnir/dashboard-nvim",
		event = "BufWinEnter",
		setup = function()
			require("plugins.ui.dashboard")
		end
	})

	use({
		"folke/twilight.nvim",
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
		config = function()
			require("plugins.ui.twilight")
		end
	})

	------------ LSP
	use({
		"williamboman/nvim-lsp-installer",
		event = "VimEnter",
		requires = {
			"folke/lua-dev.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plugins.lsp.lspconfig")
		end
	})

	use({
		"onsails/lspkind-nvim",
		event = "BufRead",
		config = function()
			require("plugins.lsp.lspkind")
		end
	})

	use({
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("plugins.lsp.lspsaga")
		end
	})

	use({
		"ray-x/lsp_signature.nvim",
		after = "nvim-lsp-installer",
		config = function()
			require("plugins.lsp.lspsignature")
		end
	})

	------------ Tools
	use({
		"L3MON4D3/LuaSnip",
		requires = { "rafamadriz/friendly-snippets" },
		config = function()
			require("plugins.tools.luasnip")
		end
	})

	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins.tools.cmp")
		end
	})

	use({
		"hrsh7th/cmp-nvim-lsp",
		after = "nvim-cmp",
	})

	use({
		"saadparwaiz1/cmp_luasnip",
		after = "nvim-cmp",
	})

	use({
		"hrsh7th/cmp-buffer",
		after = "nvim-cmp",
	})

	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh",
		after = "nvim-cmp",
	})

	use({
		"David-Kunz/cmp-npm",
		after = "nvim-cmp",
	})

	use({
		"hrsh7th/cmp-emoji",
		after = "nvim-cmp",
	})

	use({
		"hrsh7th/cmp-calc",
		after = "nvim-cmp",
	})

	use({
		"hrsh7th/cmp-path",
		after = "nvim-cmp",
	})

	use({
		"hrsh7th/cmp-nvim-lua",
		after = "nvim-cmp",
	})

	use({
		"windwp/nvim-autopairs",
		after = "nvim-cmp",
		config = function()
			require("plugins.tools.autopairs")
		end,
	})

	use({
		"sbdchd/neoformat",
		cmd = "Neoformat",
	})

	use({
		"lewis6991/gitsigns.nvim",
		after = "plenary.nvim",
		config = function()
			require("plugins.tools.gitsigns")
		end
	})

	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require("plugins.tools.telescope")
		end
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
		after = "telescope.nvim",
		config = function()
			require("telescope").load_extension("fzf")
		end
	})

	use({
		"Asheq/close-buffers.vim",
		event = "BufRead"
	})

	use({
		"reedes/vim-pencil",
		cmd = { "Pencil", "NoPencil", "TogglePencil", "SoftPencil", "HardPencil" }
	})

	use({
		"mg979/vim-visual-multi",
		event = "CursorMoved"
	})

	------------ Utils
	use({
		"Pocco81/AutoSave.nvim",
		branch = "dev",
		event = "BufRead",
		config = function()
			require("plugins.utils.autosave")
		end
	})

	use({
		"kwkarlwang/bufresize.nvim",
		event = "VimEnter",
		commit = "0d300e66fb553ad8c0bc5eaaf0f14c2dcba374e7",
		config = function()
			require("plugins.utils.bufresize")
		end
	})

	use({
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("plugins.utils.neoscroll")
		end
	})

	use({
		"Pocco81/TrueZen.nvim",
		branch = "dev",
		cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
		config = function()
			require("plugins.utils.truezen")
		end
	})

	use({
		"Pocco81/HighStr.nvim",
		branch = "dev",
		cmd = { "HSHighlight", "HSRmHighlight", "HSImport", "HSExport" },
		keys = { "<F3>", "<F4>" }, -- custom mappings
		config = function()
			require("plugins.utils.highstr")
		end
	})

	use({
		"mbbill/undotree",
		cmd = { "UndotreeToggle" }
	})

	use({
		"folke/todo-comments.nvim",
		after = "catppuccin",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("plugins.utils.todocomments")
		end
	})

	use({
		"folke/trouble.nvim",
		after = "catppuccin",
		config = function()
			require("plugins.utils.trouble")
		end
	})

	use({
		"numToStr/Comment.nvim",
		config = function ()
			require("Comment").setup()
		end
	})

	use("ludovicchabant/vim-gutentags") -- Automatic tags management

	----------------------------=== Extensions ===--------------------------
	use({
		"folke/lua-dev.nvim",
		opt = true,
		ft = "lua"
	})

	use({
		"simrat39/rust-tools.nvim",
		opt = true,
		ft = "rust"
	})

	use({
		"vim-crystal/vim-crystal",
		opt = true,
		ft = "crystal"
	})

	use({
		"fladson/vim-kitty",
		opt = true,
		ft = "kitty"
	})

	use({
		"ray-x/go.nvim",
		opt = true,
		ft = "go",
		config = function()
			require("go").setup()
		end
	})

	use({
		"windwp/nvim-ts-autotag",
		opt = true,
		ft = { "html", "xml", "xhtml", "phtml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
		config = function()
			require("plugins.extensions.ts_autotag")
		end
	})

	use({
		"editorconfig/editorconfig-vim",
		opt = true,
		event = "BufRead"
	})
end)
