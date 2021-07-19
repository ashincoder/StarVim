-- This is a example config.
-- 'Sv' is the global options object
-- General Settings
Sv.number = true
Sv.relative_number = false

Sv.pumheight = 20
Sv.timeoutlen = 100

Sv.shell = "zsh"

Sv.undofile = true

Sv.leader_key = " "
Sv.colorscheme = "stardark" -- The only added colorscheme is stardark and icy.

Sv.autosave = false
Sv.format_on_save = true

-- Disable or Enable Plugins
Sv.plugin_disable = {
	dashboard = false,
	whichkey = false,
	zenmode = true,
	lazygit = true,
}

-- 0 is true
-- 1 is false
-- TODO will add more plugins
Sv.plugin = {
	dashboard = {
		dashboard_enter = 0,
		statusline_disable = 1,
	},
}

-- TreeSitter parsers config
Sv.treesitter.ensure_installed = { "python", "lua", "bash", "javascript", "html", "css" }
Sv.treesitter.ignore_install = { "haskell" }
Sv.treesitter.highlight.enabled = true

-- lua
-- Sv.lang.lua.formatter.exe = "stylua"

-- python
-- Sv.lang.python.isort = true
-- Sv.lang.python.diagnostics.virtual_text = true
-- Sv.lang.python.analysis.use_library_code_types = true
-- to change default formatter from yapf to black
-- Sv.lang.python.formatter.exe = "black"
-- Sv.lang.python.formatter.args = {"-"}

-- go
-- to change default formatter from gofmt to goimports
-- Sv.lang.go.formatter.exe = "goimports"

-- javascript formatter is prettier

-- rust
-- Sv.lang.rust.formatter = {
-- 	exe = "rustfmt",
-- 	args = { "--emit=stdout" },
-- }

-- Additional Plugins
-- Sv.user_plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

-- Additional Leader bindings for WhichKey
-- Sv.user_which_key = {

--   A = {
--     name = "+Custom Leader Keys",
--     a = { "<cmd>'Command for a key'<cr>", "Description for a" },
--     b = { "<cmd>'Command for b key'<cr>", "Description for b" },
--   },

-- }

-- Additional Autocommands
-- Sv.user_autocommands = {  }
