local colors = {
	white = "#abb2bf",
	black = "#1e222a", --  nvim bg
	black2 = "#252931",
	grey_fg = "#565c64",
	light_grey = "#6f737b",
	red = "#d47d85",
	green = "#A3BE8C",
	lightbg = "#2d3139",
	lightbg2 = "#262a32",
}

local bufferline
if not pcall(function()
	bufferline = require("bufferline")
end) then
	return
end

bufferline.setup({
	options = {
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		view = "multiwindow",
		show_buffer_close_icons = true,
		separator_style = "thin",
		mappings = true,
		always_show_bufferline = true,
	},
	highlights = {
		fill = {
			guifg = colors.grey_fg,
		},
		-- buffers
		buffer_visible = {
			guifg = colors.light_grey,
		},
		buffer_selected = {
			guifg = colors.white,
			gui = "bold",
		},
		-- tabs
		tab = {
			guifg = colors.light_grey,
		},
		tab_selected = {
			guifg = colors.black2,
		},
		tab_close = {
			guifg = colors.red,
		},
		indicator_selected = {
			guifg = colors.black,
		},
		-- separators
		separator = {
			guifg = colors.black2,
		},
		separator_visible = {
			guifg = colors.black2,
		},
		separator_selected = {
			guifg = colors.black2,
		},
		-- modified
		modified = {
			guifg = colors.red,
		},
		modified_visible = {
			guifg = colors.red,
		},
		modified_selected = {
			guifg = colors.green,
		},
		-- close buttons

		close_button = {
			guifg = colors.light_grey,
		},
		close_button_visible = {
			guifg = colors.light_grey,
		},
		close_button_selected = {
			guifg = colors.red,
		},
	},
})

return colors
