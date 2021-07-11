-- This is a example config.
-- 'Sv' is the global options object
-- General Settings
Sv.number = true
Sv.relative_number = false

Sv.pumheight = 20
Sv.timeoutlen = 100

Sv.shell = "zsh"

Sv.undofile = true

Sv.leader_key = ' '
Sv.colorscheme = 'tokyonight'

-- TreeSitter parsers config
-- Sv.treesitter.ensure_installed = "all"
-- Sv.treesitter.ignore_install = {"haskell"}
Sv.treesitter.highlight.enabled = true


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
