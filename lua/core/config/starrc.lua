local utils = require("utils")
local log = require("core.logging")

local M = {}

log.debug("Loading Doom starrc module ...")

-- default_starrc_values loads the default starrc values
-- @return table
local function default_starrc_values()
	return {
		ui = {
			"dashboard", -- Start screen
			"statusline", -- Statusline
			"tabline", -- Tabline, shows your buffers list at top
			"which-key", -- Keybindings popup menu like Emacs' guide-key
			-- 'zen',         -- Distraction free environment
			-- 'indentlines', -- Show indent lines
			-- 'doom-themes', -- Additional doom emacs' colorschemes
		},
		star = {
			-- 'orgmode',    -- Life Organization Tool
			-- 'runner',   -- Open a REPL for the current language or run the current file
			-- 'compiler', -- Compile (and run) your code with just pressing three keys!
		},
		editor = {
			-- 'auto-session',    -- A small automated session manager for Neovim
			-- 'terminal',     -- Terminal for Neovim (NOTE: needed for runner and compiler)
			"nvim-tree", -- Tree explorer
			"symbols", -- LSP symbols and tags
			-- 'minimap',      -- Code minimap, requires github.com/wfxr/code-minimap
			"gitsigns", -- Git signs
			"telescope", -- Highly extendable fuzzy finder over lists
			-- 'restclient',   -- A fast Neovim http client
			"formatter", -- File formatting
			"autopairs", -- Autopairs
			-- 'editorconfig', -- EditorConfig support for Neovim
			"commentary", -- Comments plugin
			"lsp", -- Language Server Protocols
		},
		utilities = {
			-- 'suda',            -- Write and read files without sudo permissions
			-- 'lazygit',         -- LazyGit integration for Neovim, requires LazyGit
			-- 'colorizer',       -- Fastets colorizer for Neovim
			-- 'range-highlight',    -- hightlights ranges you have entered in commandline
		},
	}
end

-- load_starrc Loads the doomrc if it exists, otherwise it'll fallback to doom
-- default configs.
M.load_starrc = function()
	local config

	-- /home/user/.config/doom-nvim/starrc
	if vim.fn.filereadable(utils.star_root .. "/starrc.lua") == 1 then
		local loaded_starrc, err = pcall(function()
			log.debug("Loading the starrc file ...")
			config = dofile(utils.star_root .. "/starrc.lua")
		end)

		if not loaded_starrc then
			log.debug("Error while loading the starrc. Traceback:\n" .. err)
		end
	else
		log.debug("No starrc.lua file found, falling to defaults")
		config = default_starrc_values()
	end

	return config
end

return M
