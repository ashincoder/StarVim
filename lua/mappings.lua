local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {silent = true, noremap = true}

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them
--[[ remove this line

map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)

 this line too ]]
--

-- copy whole file content
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- Save with Ctrl-s
map("n", "<C-s>", ":w <CR>", opt)
-- vim.cmd("inoremap jh <Esc>")

-- compe stuff


-- bufferline tab stuff
map("n", "<S-t>", ":tabnew<CR>", opt) -- new tab
map("n", "<S-x>", ":bd!<CR>", opt) -- close tab

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

-- better indenting
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", opt)
map("x", "J", ":move '>+1<CR>gv-gv", opt)

-- QuickFix
map("n", "]q", ":cnext<CR>", opt)
map("n", "[q", ":cprev<CR>", opt)

-- better window movement
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
