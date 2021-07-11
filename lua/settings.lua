local opt = vim.opt
local cmd = vim.cmd

cmd "filetype plugin on"

opt.ruler = false
opt.hidden = true
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hlsearch = Sv.hl_search
opt.ignorecase = Sv.ignorecase
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.cul = true
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

-- Numbers
opt.number = Sv.number
opt.numberwidth = Sv.number_width
opt.relativenumber = Sv.relativenumber

-- for indenline
opt.expandtab = Sv.expandtab
opt.shiftwidth = Sv.shiftwidth
opt.smartindent = Sv.smartindent
opt.tabstop = Sv.tab_stop -- insert 4 spaces for a tab

-- disable builtin vim plugins
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_matchit = 0
vim.g.loaded_matchparen = 0
vim.g.loaded_spec = 0

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
vim.cmd(
    [[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])

return M
