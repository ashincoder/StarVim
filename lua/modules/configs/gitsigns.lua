require("gitsigns").setup({
	signs = {
		add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
		change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
		delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
		topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
		changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
	},
	numhl = false,
	keymaps = {
		-- Default keymap options
		noremap = true,
		buffer = true,
		["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
		["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
		["n <leader>js"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		["n <leader>ju"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		["n <leader>jr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		["n <leader>jp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		["n <leader>jb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
	},
	watch_index = {
		interval = 100,
	},
	sign_priority = 5,
	status_formatter = nil, -- Use default
})
