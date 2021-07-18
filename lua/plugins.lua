-- TODO Lazy Load most of the plugins

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

	-- Bufferline
	use({
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("core.bufferline").config()
		end,
		event = "BufWinEnter",
	})

	-- Statusline
	use({
		"ashincoder/lualine.nvim",
		config = function()
			require("core.lualine").config()
		end,
		event = "BufWinEnter",
	})

	-- Colors -- TODO add more colors
	use({
		"rktjmp/lush.nvim",
		event = "VimEnter",
		requires = { "ashincoder/stardark" },
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

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require("core.treesitter").config()
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

	-- Completion
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

	-- Formatter
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("core.formatter")
		end,
		event = "BufRead",
	})

	-- File Explorer, Manager ..
	use({
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require("core.nvimtree").config()
		end,
	})

	-- Icons
	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("core.icons").config()
		end,
	})

	-- Lua Libraries
	use({ "nvim-lua/popup.nvim", module = "popup" })
	use({ "nvim-lua/plenary.nvim", module = "plenary" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		event = "BufWinEnter",
		config = function()
			require("core.telescope").config()
		end,
	})

	-- Git stuff
	-- TODO lazy load
	-- use({
	-- 	"kdheepak/lazygit.nvim",
	-- 	event = "BufWinEnter",
	-- 	disable = Sv.plugin_disable.lazygit,
	-- })

	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("core.gitsigns").config()
		end,
	})

	-- WhichKey
	use({
		"folke/which-key.nvim",
		keys = "<space>",
		config = function()
			require("core.whichkey").config()
		end,
		disable = Sv.plugin_disable.whichkey,
	})

	-- AutoPairs
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
		config = function()
			require("core.dashboard").config()
		end,
		disable = Sv.plugin_disable.dashboard,
	})

	use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })

	-- AutoSave
	use({
		"Pocco81/AutoSave.nvim",
		config = function()
			require("core.zenmode").autoSave()
		end,
		cond = function()
			return vim.g.auto_save == Sv.autosave
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
			require("core.zenmode").config()
		end,
		disable = Sv.plugin_disable.zenmode,
	})

	--   use "alvan/vim-closetag" -- for html autoclosing tag

	-- Indent lines
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
