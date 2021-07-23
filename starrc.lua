local star = {
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
		"lsp", -- Language Server Protocols
		"nvim-tree", -- Tree explorer
		"symbols", -- LSP symbols and tags
		"gitsigns", -- Git signs
		"telescope", -- Highly extendable fuzzy finder over lists
		"formatter", -- File formatting
		"autopairs", -- Autopairs
		"commentary", -- Comments plugin
		"terminal", -- Terminal for Neovim (NOTE: needed for runner and compiler)
		-- 'auto-session',    -- A small automated session manager for Neovim
		-- 'minimap',      -- Code minimap, requires github.com/wfxr/code-minimap
		-- 'restclient',   -- A fast Neovim http client
		-- 'editorconfig', -- EditorConfig support for Neovim
	},
	utilities = {
		"colorizer", -- Fastets colorizer for Neovim
		-- 'suda',            -- Write and read files without sudo permissions
		-- 'range-highlight',    -- hightlights ranges you have entered in commandline
	},
}

return star
