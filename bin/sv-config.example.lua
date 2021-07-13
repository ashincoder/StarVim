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
Sv.colorscheme = "tokyonight"
Sv.autosave = false
Sv.format_on_save = true

-- TODO will add more plugins
-- Disable or Enable Plugins
Sv.plugin = {
	dashboard_disable = 0,
}

-- TreeSitter parsers config
-- Sv.treesitter.ensure_installed = "all"
Sv.treesitter.ignore_install = { "haskell" }
Sv.treesitter.highlight.enabled = true

-- lua
-- Sv.lang.lua.formatter.exe = "stylua"

-- python
-- Sv.lang.python.linter = 'flake8'
-- Sv.lang.python.isort = true
-- Sv.lang.python.diagnostics.virtual_text = true
-- Sv.lang.python.analysis.use_library_code_types = true
-- to change default formatter from yapf to black
-- Sv.lang.python.formatter.exe = "black"
-- Sv.lang.python.formatter.args = {"-"}

-- go
-- to change default formatter from gofmt to goimports
-- Sv.lang.go.formatter.exe = "goimports"

-- javascript
-- Sv.lang.tsserver.linter = nil

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
