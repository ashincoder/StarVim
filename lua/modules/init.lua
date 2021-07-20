vim.cmd([[packadd packer.nvim]])

local present, _ = pcall(require, "modules.configs.packer")

if present then
	Packer = require("packer")
else
	return false
end

local use = Packer.use

return Packer.startup(function()
	use({ "wbthomason/packer.nvim", event = "VimEnter" })

	------------------------ UI ---------------------------

	-- Bufferline
	use({
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("modules.configs.bufferline")
		end,
		event = "BufWinEnter",
	})

	-- Statusline
	use({
		"ashincoder/lualine.nvim",
		config = function()
			require("modules.configs.lualine")
		end,
		event = "BufWinEnter",
	})

	-- Colors -- TODO add more colors
	use({
		"rktjmp/lush.nvim",
		event = "VimEnter",
		requires = { "ashincoder/stardark", "ashincoder/icy.nvim" },
		config = function()
			require("lush")(require(Sv.colorscheme))
		end,
	})

	-- Colorizer
	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("colorizer").setup()
			vim.cmd("ColorizerReloadAllBuffers")
		end,
	})

	------------------------ Language specific ---------------------------

	-- Completion
	use({
		"hrsh7th/nvim-compe",
		event = "InsertEnter",
		config = function()
			require("modules.configs.compe")
		end,
		wants = { "LuaSnip" },
		requires = {
			{
				"L3MON4D3/LuaSnip",
				wants = "friendly-snippets",
				event = "InsertCharPre",
				config = function()
					require("modules.configs.luasnip")
				end,
			},
			{
				"rafamadriz/friendly-snippets",
				event = "InsertCharPre",
			},
		},
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
		event = "BufRead",
		config = function()
			require("modules.configs.treesitter")
		end,
	})

	-- LSP
	use({
		"kabouzeid/nvim-lspinstall",
		module = "lspinstall",
	})

	use({
		"neovim/nvim-lspconfig",
		event = "BufRead",
		config = function()
			require("modules.configs.lsp_config")
		end,
	})

	use({
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("modules.configs.lsp_sign")
		end,
	})

	use({
		"onsails/lspkind-nvim",
		event = "BufRead",
		config = function()
			require("lspkind").init()
		end,
	})

	-- Formatter
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("modules.configs.formatter")
		end,
		event = "BufRead",
	})

	------------------------ File manager, Picker, Fuzzy finder ---------------------------

	-- Icons
	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("modules.configs.gitsigns")
		end,
	})

	use({
		"kyazdani42/nvim-web-devicons",
		after = "lush.nvim",
		config = function()
			require("modules.configs.icons")
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require("modules.configs.nvimtree")
		end,
	})

	-- Lua Libraries
	use({ "nvim-lua/popup.nvim", module = "popup" })
	use({ "nvim-lua/plenary.nvim", module = "plenary" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = "telescope",
		config = function()
			require("modules.configs.telescope")
		end,
	})

	-- Git stuff
	-- TODO lazy load
	use({
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitConfig" },
		disable = Sv.plugin_disable.lazygit,
	})

	------------------------ Misc Plugins ---------------------------

	-- WhichKey
	use({
		"folke/which-key.nvim",
		keys = "<space>",
		config = function()
			require("modules.configs.whichkey")
		end,
		disable = Sv.plugin_disable.whichkey,
	})

	-- AutoPairs
	use({
		"windwp/nvim-autopairs",
		after = "nvim-compe",
		config = function()
			require("modules.configs.autopairs")
		end,
	})

	-- Matching parens
	use({ "andymass/vim-matchup", event = "CursorMoved" })

	-- Commentary
	use({
		"terrortylor/nvim-comment",
		cmd = "CommentToggle",
		config = function()
			require("nvim_comment").setup()
		end,
	})

	-- Dashboard
	use({
		"glepnir/dashboard-nvim",
		-- event = "VimEnter",
		config = function()
			require("modules.configs.dashboard")
		end,
		cmd = "Dashboard",
		disable = Sv.plugin_disable.dashboard,
	})

	use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })

	-- AutoSave
	use({
		"Pocco81/AutoSave.nvim",
		config = function()
			require("modules.configs.autosave")
		end,
		cond = function()
			return Sv.autosave == true
		end,
	})

	-- Smooth Scroll
	use({
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup()
		end,
	})

	-- Zen Mode
	use({
		"Pocco81/TrueZen.nvim",
		cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
		config = function()
			require("modules.configs.zenmode")
		end,
		disable = Sv.plugin_disable.zenmode,
	})

	--   use "alvan/vim-closetag" -- for html autoclosing tag

	-- Indent lines
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = function()
			require("modules.configs.blankline")
		end,
	})

	for _, plugin in pairs(Sv.user_plugins) do
		Packer.use(plugin)
	end
end)
