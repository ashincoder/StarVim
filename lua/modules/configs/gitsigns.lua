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

		["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
		["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

		["n <space>gs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		["v <space>gs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		["n <space>gu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		["n <space>gr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		["v <space>gr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		["n <space>gR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
		["n <space>gp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		["n <space>gb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

		-- Text objects
		["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
		["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
	},
	watch_index = {
		interval = 100,
	},
	sign_priority = 5,
	status_formatter = nil, -- Use default
})
