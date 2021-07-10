local M = {}

function M.reload_config()
  vim.cmd "source ~/.config/nvim/kv-config.lua"
  vim.cmd "source ~/.config/nvim/lua/pluginList.lua"
  vim.cmd ":PackerInstall"
  vim.cmd ":PackerCompile"
end

-- blankline config
M.blankline = function()
    vim.g.indentLine_enabled = 1
    vim.g.indent_blankline_char = "▏"

    vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
    vim.g.indent_blankline_buftype_exclude = {"terminal"}

    vim.g.indent_blankline_show_trailing_blankline_indent = false
    vim.g.indent_blankline_show_first_indent_level = false
end

-- hide line numbers , statusline in specific buffers!
M.hideStuff = function()
    vim.api.nvim_exec(
        [[
   au BufEnter term://* setlocal nonumber
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
   au BufEnter term://* set laststatus=0 
]],
        false
    )
end

return M
