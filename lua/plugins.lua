local packer = require("packer")

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
	git = {
		clone_timeout = 600, -- Timeout, in seconds, for git clones
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("core.bufferline").config()
		end,
		event = "BufWinEnter",
	})

	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("core.lualine").config()
		end,
		event = "BufWinEnter",
	})

	-- color related stuff
	-- TODO add more colors
	use({
		"ashincoder/Star-Colors",
	})

	use({
		"rktjmp/lush.nvim",
		cmd = { "Lushify", "LushRunTutorial", "LushRunQuickStart" },
	})

	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("colorizer").setup()
			vim.cmd("ColorizerReloadAllBuffers")
		end,
	})

	-- language related plugins
	use({
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require("core.treesitter").config()
		end,
	})

	use({
		"kabouzeid/nvim-lspinstall",
		module = "lspinstall",
	})

	use({
		"neovim/nvim-lspconfig",
		event = "BufRead",
		requires = { "ray-x/lsp_signature.nvim" },
		config = function()
			require("core.lspconfig").config()
		end,
	})

	use({
		"onsails/lspkind-nvim",
		event = "BufRead",
		config = function()
			require("lspkind").init()
		end,
	})

	-- load compe in insert mode only
	use({
		"hrsh7th/nvim-compe",
		event = "InsertEnter",
		config = function()
			require("core.compe").config()
		end,
		wants = { "LuaSnip" },
		requires = {
			{
				"L3MON4D3/LuaSnip",
				wants = "friendly-snippets",
				event = "InsertCharPre",
				config = function()
					require("core.compe").snippets()
				end,
			},
			"rafamadriz/friendly-snippets",
			event = "InsertCharPre",
		},
	})

	use({
		"mhartington/formatter.nvim",
		config = function()
			require("core.formatter")
		end,
		event = "BufRead",
	})

	-- file managing , picker etc
	use({
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require("core.nvimtree").config()
		end,
	})

	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("core.icons").config()
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim", module = "popup" },
			{ "nvim-lua/plenary.nvim", module = "plenary" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		keys = {
			{ "n", "<Leader>h" },
			{ "n", "<Leader>h" },
			{ "n", "<Leader>s" },
			{ "n", "<Leader>f" },
		},
		config = function()
			require("core.telescope").config()
		end,
	})

	-- git stuff

	use({
		"kdheepak/lazygit.nvim",
		cmd = { "LazyGit", "LazyGitConfig", "LazyGitFilter" },
	})

	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("core.gitsigns").config()
		end,
	})

	-- misc plugins

	use({
		"folke/which-key.nvim",
		keys = "<space>",
		config = function()
			require("core.whichkey").config()
		end,
	})

	use({
		"windwp/nvim-autopairs",
		after = "nvim-compe",
		config = function()
			require("nvim-autopairs").setup()
			require("nvim-autopairs.completion.compe").setup({
				map_cr = true,
				map_complete = true, -- insert () func completion
			})
		end,
	})

	use({ "andymass/vim-matchup", event = "CursorMoved" })

	use({
		"terrortylor/nvim-comment",
		cmd = "CommentToggle",
		config = function()
			require("nvim_comment").setup()
		end,
	})

	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("core.dashboard").config()
		end,
	})

	use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })

	-- load autosave only if its globally enabled
	use({
		"Pocco81/AutoSave.nvim",
		config = function()
			require("core.zenmode").autoSave()
		end,
		cond = function()
			return vim.g.auto_save == Sv.autosave
		end,
	})

	-- smooth scroll
	use({
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup()
		end,
	})

	use({
		"Pocco81/TrueZen.nvim",
		cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
		config = function()
			require("core.zenmode").config()
		end,
	})

	--   use "alvan/vim-closetag" -- for html autoclosing tag

	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = function()
			require("utils").blankline()
		end,
	})

	for _, plugin in pairs(Sv.user_plugins) do
		packer.use(plugin)
	end
end)
