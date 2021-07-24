require("toggleterm").setup({
	size = Sv.terminal_height,
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	start_in_insert = true,
	persist_size = true,
	direction = Sv.terminal_direction,
	close_on_exit = true,
	float_opts = {
		border = "curved",
		width = Sv.terminal_width,
		height = Sv.terminal_height,
		winblend = 0,
		highlights = {
			border = "Special",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
	lazygit:toggle()
end
