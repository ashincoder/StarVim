CONFIG_PATH = vim.fn.stdpath "config"
DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERMINAL"
USER = vim.fn.expand "$USER"

Sv = {
    number = true,
    relativenumber = false,
    number_width = 4,

    spell = false,
    spelllang = "en",

    shiftwidth = 2,
    tab_stop = 2,
    expandtab = true,
    smartindent = true,

    shell = "zsh",
    cmdheight = 1,

    undofile = true,
    swapfile = false,

    pumheight = 20,
    timeoutlen = 200,

    ignorecase = true,
    hl_search = true,

    leader_key = ' ',
    autosave = false,

    treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true, use_languagetree = true}
    },

    user_which_key = {},
    user_plugins = {
        -- Put plugins in sv-config.lua
    },
    user_autocommands = {
        {"FileType", "qf", "set nobuflisted"}
    }
}
