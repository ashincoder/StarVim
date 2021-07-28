local star = {
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
	},
<<<<<<< HEAD
=======
	colors = {
		"stardark", -- The shiny theme
		-- "gruvbox", -- The almighty
		-- "icy", -- Shiver to death!
	},
>>>>>>> dev
	editor = {
		"lsp", -- Language Server Protocols
		"completion", -- The ultimate completion
		"nvim-tree", -- Tree explorer
		"symbols", -- LSP symbols and tags
		"gitsigns", -- Git signs
		"telescope", -- Highly extendable fuzzy finder over lists
		"formatter", -- File formatting
		"autopairs", -- Autopairs
		"commentary", -- Commentary plugin
		-- "terminal", -- Terminal for Neovim (NOTE: needed for runner and compiler)
		-- 'minimap',      -- Code minimap, requires github.com/wfxr/code-minimap
	},
	utilities = {
		"colorizer", -- Fastets colorizer for Neovim
		-- 'lazygit',         -- LazyGit integration for Neovim, requires LazyGit
		-- 'suda',            -- Write and read files without sudo permissions
		-- 'range-highlight',    -- hightlights ranges you have entered in commandline
	},
}

return star
