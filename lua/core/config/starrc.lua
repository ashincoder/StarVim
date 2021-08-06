local utils = require("utils")
local log = require("core.logging")

local M = {}

log.debug("Loading starplug module ...")

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
		},
		star = {
			-- 'orgmode',    -- Life Organization Tool
			-- 'runner',    -- Code runner for your language
		},
		colors = {
			"stardark", -- The shiny theme
			-- "gruvbox", -- The almighty
			-- "icy", -- Shiver to death!
			-- "neon", -- Welcome to the light
		},
		editor = {
			-- 'terminal',     -- Terminal for Neovim (NOTE: needed for runner and compiler)
			"nvim-tree", -- Tree explorer
			"symbols", -- LSP symbols and tags
			-- 'minimap',      -- Code minimap, requires github.com/wfxr/code-minimap
			"gitsigns", -- Git signs
			"telescope", -- Highly extendable fuzzy finder over lists
			"formatter", -- File formatting
			"autopairs", -- Autopairs
			"commentary", -- Comments plugin
			"lsp", -- Language Server Protocols
			"lint", -- A beauty teacher for your language
		},
		utilities = {
			-- 'suda',            -- Write and read files without sudo permissions
			-- 'lazygit',         -- LazyGit integration for Neovim, requires LazyGit
			-- 'colorizer',       -- Fastets colorizer for Neovim
		},
	}
end

-- load_starrc Loads the doomrc if it exists, otherwise it'll fallback to doom
-- default configs.
M.load_starrc = function()
	local config

	-- /home/user/.config/doom-nvim/starrc
	if vim.fn.filereadable(utils.star_root .. "/starplug.lua") == 1 then
		local loaded_starrc, err = pcall(function()
			log.debug("Loading the starplug file ...")
			config = dofile(utils.star_root .. "/starplug.lua")
		end)

		if not loaded_starrc then
			log.debug("Error while loading the starplug. Traceback:\n" .. err)
		end
	else
		log.debug("No starplug.lua file found, falling to defaults")
		config = default_starrc_values()
	end

	return config
end

return M
