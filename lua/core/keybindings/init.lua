local utils = require("utils")

local opt = { silent = true }

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them
--[[ remove this line

utils.map("n", "dd", [=[ "_dd ]=], opt)
utils.map("v", "dd", [=[ "_dd ]=], opt)
utils.map("v", "x", [=[ "_x ]=], opt)

 this line too ]]

-- Compe

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

--  compe mappings
utils.map("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
utils.map("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
utils.map("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
utils.map("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
utils.map("i", "<CR>", "v:lua.completions()", { expr = true })

-- copy whole file content
utils.map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- Save with Ctrl-s
utils.map("n", "<C-s>", ":w <CR>", opt)

-- Esc with jh
utils.map("i", "jk", "<esc>", {})
utils.map("v", "jk", "<esc>", {})

-- bufferline tab stuff
utils.map("n", "<S-t>", ":enew<CR>", opt) -- new tab
utils.map("n", "<S-x>", ":bd!<CR>", opt) -- close tab

-- move between tabs
utils.map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
utils.map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

-- better indenting
utils.map("v", "<", "<gv", opt)
utils.map("v", ">", ">gv", opt)

-- use ESC to turn off search highlighting
utils.map("n", "<Esc>", ":noh<CR>", opt)

-- use ESC to turn off search highlighting
utils.map("t", "<Esc>", "<C-\\><C-n>", opt)

-- Move selected line / block of text in visual mode
utils.map("x", "K", ":move '<-2<CR>gv-gv", opt)
utils.map("x", "J", ":move '>+1<CR>gv-gv", opt)
-- QuickFix
utils.map("n", "]q", ":cNext<CR>", opt)
utils.map("n", "[q", ":cPrev<CR>", opt)

-- Don't copy the replaced text after pasting in visual mode
utils.map("v", "p", '"_dP', opt)

-- better window movement
utils.map("n", "<C-h>", "<C-w>h", opt)
utils.map("n", "<C-j>", "<C-w>j", opt)
utils.map("n", "<C-k>", "<C-w>k", opt)
utils.map("n", "<C-l>", "<C-w>l", opt)
