local opt = vim.opt

opt.ruler = false
opt.hidden = true
opt.hlsearch = Sv.hl_search
opt.ignorecase = Sv.ignorecase
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = Sv.termguicolors -- set term gui colors (most terminals support this)
opt.cul = true
opt.scrolloff = Sv.scrolloff
opt.mouse = "a" -- enable mouse in neovim
opt.signcolumn = "yes"
opt.cmdheight = Sv.cmdheight
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = Sv.timeoutlen -- set time out intervel
opt.clipboard = "unnamedplus"
opt.guifont = "Sv." -- the font used in graphical neovim applications
opt.pumheight = Sv.pumheight -- pop up menu height
opt.undodir = CACHE_PATH .. "/undo" -- set an undo directory
opt.undofile = Sv.undofile -- enable persisten undo
opt.swapfile = Sv.swapfile -- creates a swapfile
opt.spell = Sv.spell
opt.spelllang = Sv.spelllang
opt.shortmess:append("sI") -- Disable nvim intro
vim.cmd("let &fcs='eob: '")

vim.cmd([[
    syntax off
    filetype off
    filetype plugin indent off
]])

opt.whichwrap:append("<>hl") -- Able to move through a setence with 'h' and 'l'

-- Numbers
opt.number = Sv.number
opt.numberwidth = Sv.number_width
opt.relativenumber = Sv.relativenumber

-- for indenline
opt.expandtab = Sv.expandtab
opt.shiftwidth = Sv.shiftwidth
opt.smartindent = Sv.smartindent
opt.tabstop = Sv.tab_stop -- insert 4 spaces for a tab

local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin", -- 'man',
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
	-- "matchparen",
	-- "shada_plugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

if Sv.leader_key == " " or Sv.leader_key == "space" then
	vim.g.mapleader = " "
else
	vim.g.mapleader = Sv.leader_key
end

local M = {}

function M.is_buffer_empty()
	-- Check whether the current buffer is empty
	return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
	-- Check if the windows width is greater than a given number of columns
	return vim.fn.winwidth(0) / 2 > cols
end

-- file extension specific tabbing
vim.cmd([[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])

return M
