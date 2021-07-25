local compe
if not pcall(function()
	compe = require("compe")
end) then
	return
end

compe.setup({
	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = true,
	source = {
		orgmode = true,
		nvim_lsp = true,
		nvim_lua = true,
		buffer = { kind = "﬘", true },
		luasnip = { kind = "﬌", true },
	},
})

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif check_back_space() then
		return t("<Tab>")
	else
		return vim.fn["compe#complete"]()
	end
end

_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
		return t("<Plug>(vsnip-jump-prev)")
	else
		return t("<S-Tab>")
	end
end

function _G.completions()
	local npairs
	if not pcall(function()
		npairs = require("nvim-autopairs")
	end) then
		return
	end

	if vim.fn.pumvisible() == 1 then
		if vim.fn.complete_info()["selected"] ~= -1 then
			return vim.fn["compe#confirm"]("<CR>")
		end
	end
	return npairs.check_break_line_char()
end

-- Luasnip
local ls = require("luasnip")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
})
require("luasnip/loaders/from_vscode").load()
