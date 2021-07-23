local utils = require("utils")

local M = {}

local function default_starrc_values()
	return {
		ui = {
			"dashboard", -- Start screen
			"statusline", -- Statusline
			"tabline", -- Tabline, shows your buffers list at top
			"which-key", -- Keybindings popup menu like Emacs" guide-key
			-- "star-colors", -- A pack of StarVim colorschemes
			-- "indentlines", -- Show indent lines
			-- "zen",         -- Distraction free environment
		},
		star = {
			-- "neorg",    -- Life Organization Tool
			-- "runner",   -- Open a REPL for the current language or run the current file
			-- "compiler", -- Compile (and run) your code with just pressing three keys!
		},
		editor = {
			"lsp", -- Language Server Protocols
			"nvim-tree", -- Tree explorer
			"symbols", -- LSP symbols and tags
			"gitsigns", -- Git signs
			"telescope", -- Highly extendable fuzzy finder over lists
			"commentary", -- Comments plugin
			"snippets", -- LSP snippets
			"formatter", -- File formatting
			"terminal", -- Terminal for Neovim (NOTE: needed for runner and compiler)
			-- "minimap",      -- Code minimap, requires github.com/wfxr/code-minimap
			-- "restclient",   -- A fast Neovim http client
			-- "editorconfig", -- EditorConfig support for Neovim
		},
		utilities = {
			-- "suda",            -- Write and read files without sudo permissions
			-- "lazygit",         -- LazyGit integration for Neovim, requires LazyGit
			-- "neogit",          -- Magit for Neovim
			-- "colorizer",       -- Fastets colorizer for Neovim
			-- "range-highlight", -- hightlights ranges you have entered in commandline
		},
	}
end

-- load_starrc Loads the starrc if it exists, otherwise it"ll fallback to default
-- default configs.
M.load_starrc = function()
	local config

	-- /home/user/.config/nvim/starrc.lua
	local loaded_starrc, err = pcall(function()
		print("Loading the starrc file ...")
		config = dofile(utils.star_root .. "/starrc.lua")
	end)
end
return M
