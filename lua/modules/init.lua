local functions = require("core.functions")

vim.cmd([[packadd packer.nvim]])

local present, _ = pcall(require, "modules.configs.packer")

if present then
	packer = require("packer")
else
	return false
end

local use = packer.use

return packer.startup(function()
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
	local disabled_stardark = functions.is_plugin_disabled("stardark")
	use({ "ashincoder/stardark", disable = disabled_stardark })

	local disabled_neon = functions.is_plugin_disabled("neon")
	use({ "ashincoder/neon", disable = disabled_neon })

	local disabled_gruvbox = functions.is_plugin_disabled("gruvbox")
	use({ "ashincoder/gruvbox.nvim", disable = disabled_gruvbox })

	local disabled_icy = functions.is_plugin_disabled("icy")
	use({ "ashincoder/icy.nvim", disable = disabled_icy })

	use({
		"rktjmp/lush.nvim",
		event = "VimEnter",
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
	local disabled_completion = functions.is_plugin_disabled("completion")
	use({
		"hrsh7th/nvim-compe",
		event = "InsertEnter",
		config = function()
			require("modules.configs.compe")
		end,
		wants = { "LuaSnip" },
		requires = {
			{
				"tamago324/compe-zsh",
				after = "nvim-compe",
			},
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
		disable = disabled_completion,
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
	local disabled_lsp = functions.is_plugin_disabled("lsp")
	use({
		"kabouzeid/nvim-lspinstall",
		module = "lspinstall",
		disable = disabled_lsp,
	})

	use({
		"neovim/nvim-lspconfig",
		module = "lspconfig",
		event = "BufRead",
		config = function()
			require("modules.configs.lsp_config")
		end,
		disable = disabled_lsp,
	})

	use({
		"glepnir/lspsaga.nvim",
		cmd = "Lspsaga",
		module = "lspsaga",
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

	-- Linter
	local disabled_lint = functions.is_plugin_disabled("lint")
	use({
		"mfussenegger/nvim-lint",
		config = function()
			require("modules.configs.linter")
		end,
		-- module = "lint",
		disable = disabled_lint,
	})

	local disabled_runner = functions.is_plugin_disabled("runner")
	use({
		"michaelb/sniprun",
		run = "bash install.sh",
		disable = disabled_runner,
		cmd = {
			"SnipRun",
			"SnipClose",
			"SnipTerminate",
			"SnipReset",
			"SnipReplMemoryClean",
		},
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
		module = "gitsigns",
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

	------------------------ Misc Plugins -------------------------

	local disabled_range_highlight = functions.is_plugin_disabled("range-highlight")
	use({
		"winston0410/range-highlight.nvim",
		requires = {
			{ "winston0410/cmd-parser.nvim", opt = true, module = "cmd-parser" },
		},
		config = function()
			require("range-highlight").setup()
		end,
		disable = disabled_range_highlight,
		event = "BufRead",
	})

	-- Write / Read files without permissions (e.vim.g. /etc files) without having
	-- to use `sudo nvim /path/to/file`
	local disabled_suda = functions.is_plugin_disabled("suda")
	use({
		"lambdalisue/suda.vim",
		disable = disabled_suda,
		cmd = { "SudaRead", "SudaWrite" },
	})

	local disabled_minimap = functions.is_plugin_disabled("minimap")
	use({
		"rinx/nvim-minimap",
		cmd = {
			"Minimap",
			"MinimapClose",
			"MinimapToggle",
			"MinimapRefresh",
			"MinimapUpdateHighlight",
		},
		disable = disabled_minimap,
	})

	local disabled_orgmode = functions.is_plugin_disabled("orgmode")
	use({
		"kristijanhusak/orgmode.nvim",
		config = function()
			require("orgmode").setup()
		end,
		disable = disabled_orgmode,
	})

	use({
		"akinsho/org-bullets.nvim",
		config = function()
			require("org-bullets").setup()
		end,
		disable = disabled_orgmode,
	})

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
	local disabled_autopairs = functions.is_plugin_disabled("autopairs")
	use({
		"windwp/nvim-autopairs",
		after = "nvim-compe",
		config = function()
			require("modules.configs.autopairs")
		end,
		disable = disabled_autopairs,
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
		event = "BufWinEnter",
		disable = disabled_dashboard,
	})

	use({
		"jdhao/better-escape.vim",
		event = "InsertEnter",
		config = function()
			vim.g.better_escape_interval = 300
			vim.g.better_escape_shortcut = { "jk" }
		end,
	})

	-- Smooth Scroll
	local disabled_neoscroll = functions.is_plugin_disabled("neoscroll")
	use({
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup()
		end,
		disable = disabled_neoscroll,
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
		packer.use(plugin)
	end
end)
