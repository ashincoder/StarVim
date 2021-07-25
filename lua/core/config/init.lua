CONFIG_PATH = vim.fn.stdpath("config")
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
TERMINAL = vim.fn.expand("$TERMINAL")
USER = vim.fn.expand("$USER")

Sv = {
	number = true,
	relativenumber = true,
	number_width = 4,
	spell = false,
	spelllang = "en",

	shiftwidth = 2,
	tab_stop = 2,
	expandtab = true,
	smartindent = true,

	termguicolors = true,
	background = "dark",
	colorscheme = "stardark",
	guifont = "JetBrains Mono:11",

	shell = "zsh",
	cmdheight = 1,

	undofile = true,
	swapfile = false,

	pumheight = 20,
	timeoutlen = 200,
	scrolloff = 5,

	ignorecase = true,
	hl_search = true,

	leader_key = " ",
	autosave = false,
	format_on_save = true,

	terminal_width = 70,
	terminal_height = 20,
	terminal_direction = "horizontal",

	treesitter = {
		ensure_installed = "lua",
		ignore_install = { "haskell" },
		highlight = {
			enabled = true,
			use_languagetree = true,
		},
	},

	user_which_key = {},
	user_plugins = {
		-- Put plugins in sv-config.lua
	},
	user_autocommands = {
		{ "FileType", "qf", "set nobuflisted" },
	},

	lang = {
		cmake = {
			formatter = {
				exe = "clang-format",
				args = {},
			},
		},
		clang = {
			diagnostics = {
				virtual_text = { spacing = 0, prefix = "" },
				signs = true,
				underline = true,
			},
			cross_file_rename = true,
			header_insertion = "never",
			filetypes = { "c", "cpp", "objc" },
			formatter = {
				exe = "clang-format",
				args = {},
			},
		},
		css = {
			virtual_text = true,
		},
		dart = {
			sdk_path = "/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot",
			formatter = {
				exe = "dart",
				args = { "format" },
			},
		},
		docker = {},
		efm = {},
		elm = {},
		emmet = { active = true },
		elixir = {},
		graphql = {},
		go = {
			formatter = {
				exe = "gofmt",
				args = {},
			},
		},
		html = {},
		java = {
			java_tools = {
				active = false,
			},
		},
		json = {
			diagnostics = {
				virtual_text = { spacing = 0, prefix = "" },
				signs = true,
				underline = true,
			},
			formatter = {
				exe = "python",
				args = { "-m", "json.tool" },
			},
		},
		kotlin = {},
		latex = {
			auto_save = false,
			ignore_errors = {},
		},
		lua = {
			diagnostics = {
				virtual_text = { spacing = 0, prefix = "" },
				signs = true,
				underline = true,
			},
			formatter = {
				exe = "stylua",
				args = {},
				stdin = false,
			},
		},
		php = {
			format = {
				format = {
					default = "psr12",
				},
			},
			environment = {
				php_version = "7.4",
			},
			diagnostics = {
				virtual_text = { spacing = 0, prefix = "" },
				signs = true,
				underline = true,
			},
			filetypes = { "php", "phtml" },
			formatter = {
				exe = "phpcbf",
				args = { "--standard=PSR12", vim.api.nvim_buf_get_name(0) },
				stdin = false,
			},
		},
		python = {
			-- @usage can be flake8 or yapf
			isort = false,
			diagnostics = {
				virtual_text = { spacing = 0, prefix = "" },
				signs = true,
				underline = true,
			},
			analysis = {
				type_checking = "basic",
				auto_search_paths = true,
				use_library_code_types = true,
			},
			formatter = {
				exe = "yapf",
				args = {},
			},
		},
		ruby = {
			diagnostics = {
				virtualtext = { spacing = 0, prefix = "" },
				signs = true,
				underline = true,
			},
			filetypes = { "rb", "erb", "rakefile", "ruby" },
			formatter = {
				exe = "rufo",
				args = { "-x" },
			},
		},
		rust = {
			rust_tools = {
				active = false,
				parameter_hints_prefix = "<-",
				other_hints_prefix = "=>", -- prefix for all the other hints (type, chaining)
			},
			-- @usage can be clippy
			formatter = {
				exe = "rustfmt",
				args = { "--emit=stdout", "--edition=2018" },
			},
			diagnostics = {
				virtual_text = { spacing = 0, prefix = "" },
				signs = true,
				underline = true,
			},
		},
		sh = {
			-- @usage can be 'shellcheck'
			-- @usage can be 'shfmt'
			diagnostics = {
				virtual_text = { spacing = 0, prefix = "" },
				signs = true,
				underline = true,
			},
			formatter = {
				exe = "shfmt",
				args = { "-w" },
				stdin = false,
			},
		},
		svelte = {},
		tailwindcss = {
			active = false,
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
			formatter = {
				exe = "prettier",
				args = { "--write", "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
				stdin = false,
			},
		},
		terraform = {},
		tsserver = {
			-- @usage can be 'eslint' or 'eslint_d'
			diagnostics = {
				virtual_text = { spacing = 0, prefix = "" },
				signs = true,
				underline = true,
			},
			formatter = {
				exe = "prettier",
				args = { "--write", "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
				stdin = false,
			},
		},
		vim = {},
		yaml = {
			formatter = {
				exe = "prettier",
				args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote" },
			},
		},
	},
}

require("core.config.settings")
