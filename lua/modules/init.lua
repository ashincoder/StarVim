local functions = require("core.functions")

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
	local disabled_tabline = functions.is_plugin_disabled("tabline")
	use({
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("modules.configs.bufferline")
		end,
		event = "BufWinEnter",
		disable = disabled_tabline,
	})

	-- Statusline
	local disabled_statusline = functions.is_plugin_disabled("statusline")
	use({
		"ashincoder/lualine.nvim",
		config = function()
			require("modules.configs.lualine")
		end,
		event = "BufWinEnter",
		disable = disabled_statusline,
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
	local disabled_colorizer = functions.is_plugin_disabled("colorizer")
	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufRead",
		config = function()
			require("colorizer").setup()
			vim.cmd("ColorizerReloadAllBuffers")
		end,
		disable = disabled_colorizer,
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
		disable = disabled_lsp,
	})

	local disabled_lsp = functions.is_plugin_disabled("lsp")
	use({
		"neovim/nvim-lspconfig",
		event = "BufRead",
		config = function()
			require("modules.configs.lsp_config")
		end,
		disable = disabled_lsp,
	})

	use({
		"kosayoda/nvim-lightbulb",
		module = "nvim-lightbulb",
		disable = disabled_lsp,
	})

	use({
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("modules.configs.lsp_sign")
		end,
		disable = disabled_lsp,
	})

	-- Viewer & finder for LSP symbols and tags
	local disabled_outline = functions.is_plugin_disabled("symbols")
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			require("modules.configs.symbols")
		end,
		disable = disabled_outline,
		cmd = {
			"SymbolsOutline",
			"SymbolsOutlineOpen",
			"SymbolsOutlineClose",
		},
	})

	use({
		"onsails/lspkind-nvim",
		event = "BufRead",
		config = function()
			require("lspkind").init()
		end,
		disable = disabled_lsp,
	})

	-- Formatter
	local disabled_formatter = functions.is_plugin_disabled("formatter")
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("modules.configs.formatter")
		end,
		event = "BufRead",
		disable = disabled_formatter,
	})

	------------------------ File manager, Picker, Fuzzy finder ---------------------------

	-- Icons
	local disabled_gitsigns = functions.is_plugin_disabled("gitsigns")
	use({
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("modules.configs.gitsigns")
		end,
		disable = disabled_gitsigns,
	})

	use({
		"kyazdani42/nvim-web-devicons",
		after = "lush.nvim",
		config = function()
			require("modules.configs.icons")
		end,
	})

	local disabled_tree = functions.is_plugin_disabled("nvim-tree")
	use({
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require("modules.configs.nvimtree")
		end,
		disable = disabled_tree,
	})

	-- Lua Libraries
	use({ "nvim-lua/popup.nvim", module = "popup" })
	use({ "nvim-lua/plenary.nvim", module = "plenary" })

	-- Telescope
	local disabled_telescope = functions.is_plugin_disabled("telescope")
	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = "telescope",
		config = function()
			require("modules.configs.telescope")
		end,
		disable = disabled_telescope,
	})

	-- Git stuff
	local disabled_lazygit = functions.is_plugin_disabled("lazygit")
	use({
		"kdheepak/lazygit.nvim",
		disable = disabled_lazygit,
		cmd = { "LazyGit", "LazyGitConfig" },
	})

	------------------------ Misc Plugins ---------------------------

	-- Terminal
	local disabled_terminal = functions.is_plugin_disabled("terminal")
	use({
		"akinsho/nvim-toggleterm.lua",
		config = function()
			require("modules.configs.toggleterm")
		end,
		disable = disabled_terminal,
		module = { "toggleterm", "toggleterm.terminal" },
		cmd = { "ToggleTerm", "TermExec" },
		keys = { "n", "<space>t" },
	})

	-- WhichKey
	local disabled_whichkey = functions.is_plugin_disabled("which-key")
	use({
		"folke/which-key.nvim",
		keys = "<space>",
		config = function()
			require("modules.configs.whichkey")
		end,
		disable = disabled_whichkey,
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
	local disabled_commentary = functions.is_plugin_disabled("commentary")
	use({
		"terrortylor/nvim-comment",
		cmd = "CommentToggle",
		config = function()
			require("nvim_comment").setup()
		end,
		disable = disabled_commentary,
	})

	-- Dashboard
	local disabled_dashboard = functions.is_plugin_disabled("dashboard")
	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("modules.configs.dashboard")
		end,
		cmd = "Dashboard",
		disable = disabled_dashboard,
	})

	use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })

	-- Smooth Scroll
	use({
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup()
		end,
	})

	-- Zen Mode
	local disabled_zen = functions.is_plugin_disabled("zen")
	use({
		"Pocco81/TrueZen.nvim",
		cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
		config = function()
			require("modules.configs.zenmode")
		end,
		disable = disabled_zen,
	})

	--   use "alvan/vim-closetag" -- for html autoclosing tag

	-- Indent lines
	local disabled_indent_lines = functions.is_plugin_disabled("indentlines")
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = function()
			require("modules.configs.blankline")
		end,
		disable = disabled_indent_lines,
	})

	for _, plugin in pairs(Sv.user_plugins) do
		Packer.use(plugin)
	end
end)
