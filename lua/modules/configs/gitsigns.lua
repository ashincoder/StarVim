require("gitsigns").setup({
	signs = {
		add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
		change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
		delete = { hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr" },
		topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
		changedelete = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
	},
	keymaps = {
		noremap = true,

		["n <leader>gj "] = "<cmd>lua require 'gitsigns'.next_hunk()<CR>", -- Next Hunk
		["n <leader>gk "] = "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", -- Prev Hunk
		["n <leader>gl "] = "<cmd>lua require 'gitsigns'.blame_line()<CR>", -- Blame
		["n <leader>gp "] = "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", -- Preview Hunk
		["n <leader>gr "] = "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", -- Reset Hunk
		["n <leader>gR "] = "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", -- Reset Buffer
		["n <leader>gs "] = "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", -- Stage Hunk
		["n <leader>gu "] = "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", -- Unstage Hunk
	},
	numhl = false,
	watch_index = {
		interval = 100,
	},
	sign_priority = 5,
	status_formatter = nil, -- Use default
})
