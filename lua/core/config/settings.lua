local opt = vim.opt

opt.number = Sv.number
opt.numberwidth = Sv.number_width
opt.relativenumber = Sv.relative_number
opt.hlsearch = Sv.hl_search
opt.ignorecase = Sv.ignorecase
opt.termguicolors = Sv.termguicolors -- set term gui colors (most terminals support this)
opt.scrolloff = Sv.scrolloff
opt.timeoutlen = Sv.timeoutlen -- set time out intervel
opt.cmdheight = Sv.cmdheight
opt.guifont = Sv.guifont -- the font used in graphical neovim applications
opt.spell = Sv.spell
opt.spelllang = Sv.spelllang
opt.pumheight = Sv.pumheight -- pop up menu height
opt.undofile = Sv.undofile -- enable persisten undo
opt.swapfile = Sv.swapfile -- creates a swapfile
opt.ruler = false
opt.hidden = true
opt.splitbelow = true
opt.splitright = true
opt.cul = true
opt.updatetime = 250 -- update interval for gitsigns
opt.mouse = "a" -- enable mouse in neovim
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.background = Sv.background

opt.undodir = CACHE_PATH .. "/undo" -- set an undo directory
opt.shortmess:append("sI") -- Disable nvim intro
vim.cmd("let &fcs='eob: '")

opt.whichwrap:append("<>hl") -- Able to move through a setence with 'h' and 'l'

-- for indentline
opt.expandtab = Sv.expandtab
opt.shiftwidth = Sv.shiftwidth
opt.smartindent = Sv.smartindent
opt.tabstop = Sv.tab_stop -- insert 4 spaces for a tab

if Sv.leader_key == " " or Sv.leader_key == "space" then
	vim.g.mapleader = " "
else
	vim.g.mapleader = Sv.leader_key
end
