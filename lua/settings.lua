local opt = vim.opt
local cmd = vim.cmd

cmd "filetype plugin on"

opt.ruler = false
opt.hidden = true
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hlsearch = Kv.hl_search
opt.ignorecase = Kv.ignorecase
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.cul = true
opt.mouse = "a" -- enable mouse in neovim
opt.signcolumn = "yes"
opt.cmdheight = Kv.cmdheight
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = Kv.timeoutlen -- set time out intervel
opt.clipboard = "unnamedplus"
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.pumheight = Kv.pumheight -- pop up menu height
opt.undodir = CACHE_PATH .. "/undo" -- set an undo directory
opt.undofile = Kv.undofile -- enable persisten undo
opt.swapfile = Kv.swapfile -- creates a swapfile
opt.spell = Kv.spell
opt.spelllang = Kv.spelllang

-- Numbers
opt.number = Kv.number
opt.numberwidth = Kv.number_width
opt.relativenumber = Kv.relativenumber

-- for indenline
opt.expandtab = Kv.expandtab
opt.shiftwidth = Kv.shiftwidth
opt.smartindent = Kv.smartindent
opt.tabstop = Kv.tab_stop -- insert 4 spaces for a tab

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
