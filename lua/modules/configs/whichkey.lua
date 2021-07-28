require("which-key").setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
		},
	},
	operators = {
		d = "Delete",
		c = "Change",
		y = "Yank (copy)",
		["g~"] = "Toggle case",
		["gu"] = "Lowercase",
		["gU"] = "Uppercase",
		[">"] = "Indent right",
		["<lt>"] = "Indent left",
		["zf"] = "Create fold",
		["v"] = "Visual Character Mode",
		gc = "Comments",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜ ", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 1 }, -- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 4, -- spacing between columns
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = {
		"<silent>",
		"<cmd>",
		"<Cmd>",
		"<CR>",
		"call",
		"lua",
		"^:",
		"^ ",
	}, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = { "<leader>" }, -- or specifiy a list manually
})

local mappings = {

	["/"] = "Comment Toggle",
	["w"] = {
		name = "+Windows",
		["c"] = { "Close Split" },
		["h"] = { "Expand Split right" },
		["l"] = { "Expand Split left" },
		["j"] = { "Expand Split above" },
		["k"] = { "Expand Split below" },
		["b"] = { "Balance Splits" },
		["s"] = { "Split Horizontal" },
		["v"] = { "Split Vertical" },
	},
	b = {
		name = "+Buffer",
		["Tab"] = { "Next Buffer" },
		["Shift Tab"] = { "Previous Buffer" },
		["n"] = { "New Buffer" },
		["d"] = { "Close Buffer" },
		["p"] = { "Pick a Buffer" },
	},
	g = {
		name = "+Git",
		g = { "Open LazyGit" },
		c = { "Checkout Commits" },
		C = { "Checkout commit(for current file)" },
		b = { "Checkout Branch" },
		t = { "Open changed file" },
		j = { "Next Hunk" },
		k = { "Prev Hunk" },
		l = { "Blame" },
		p = { "Preview Hunk" },
		r = { "Reset Hunk" },
		R = { "Reset Buffer" },
		s = { "Stage Hunk" },
		u = { "Undo Stage Hunk" },
	},
	h = {
		name = "+Help",
		t = { "Builtins" },
		c = { "Commands" },
		h = { "Help Pages" },
		k = { "Key Maps" },
		o = { "Options" },
		a = { "Auto Commands" },
	},
	c = {
		name = "+Code",
		i = { "Repl" },
		r = { "Rename Function" },
		a = { "Code Actions" },
		f = { "Find Reference" },
		s = { "Toggle Symbols Tree" },
		d = { "Declarations" },
		n = { "Diagnostic next" },
		p = { "Diagnostic prev" },
		l = { "Error List" },
		g = {
			name = "+Goto",
			D = { "Jump to Definition" },
			r = { "Jump to Reference" },
			i = { " Buf implementation " },
		},
	},
	p = {
		name = "+Plugins",
		i = { "Install" },
		s = { "Sync" },
		c = { "Clean" },
		C = { "Compile" },
		t = { "Status" },
		r = { "Reload StarVim" },
	},
	s = {
		name = "+Search",
		g = { "Word Grep" },
		b = { "Search in Buffer" },
		h = { "Command History" },
		m = { "Jump to Marks" },
	},
	f = {
		name = "+Files",
		f = { "Find Files" },
		c = { "Nvim Config Files" },
		o = { "Open Recent Files" },
		n = { "New File" },
		m = { "Media Files" },
		t = { "Format File" },
		r = { "Format File" },
		b = { "Telescope Browse Files" },
	},
	[":"] = { "Command History" },
	q = {
		name = "+Quit/Session",
		["!"] = { "Quit without saving" },
		q = { "Save Quit" },
		s = { "Save Session" },
		l = { "Session Load" },
	},
	t = {
		name = "+Terminal",
		t = { "Open Terminal" },
		v = { "Vert Split Terminal" },
		s = { "Vert Split Terminal" },
	},
	z = {
		name = "+Zen",
		z = { "Atraxis Mode" },
		m = { "Minimalist Mode" },
		f = { "Focus Mode" },
	},
	e = { "Nvim Tree" },
}

for i = 0, 10 do
	mappings[tostring(i)] = "which_key_ignore"
end

for k, v in pairs(Sv.user_which_key) do
	mappings[k] = v
end

local wk = require("which-key")

wk.register(mappings, { prefix = "<leader>" })
