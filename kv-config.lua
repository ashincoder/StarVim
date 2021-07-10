-- This is a example config.
-- 'Kv' is the global options object
-- General Settings
Kv.number = true
Kv.relative_number = false

Kv.pumheight = 20
Kv.timeoutlen = 100

Kv.shell = "zsh"

Kv.undofile = true

Kv.leader_key = ' '
Kv.colorscheme = 'tokyonight'

-- TreeSitter parsers config
Kv.treesitter.ensure_installed = "all"
Kv.treesitter.ignore_install = {"haskell"}
Kv.treesitter.highlight.enabled = true


-- Additional Plugins
-- Kv.user_plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "InsertEnter"
--     }
-- }

-- Additional Leader bindings for WhichKey
-- Kv.user_which_key = {

--   A = {
--     name = "+Custom Leader Keys",
--     a = { "<cmd>'Command for a key'<cr>", "Description for a" },
--     b = { "<cmd>'Command for b key'<cr>", "Description for b" },
--   },

-- }
