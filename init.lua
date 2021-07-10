-- Load config
require "config"
vim.cmd("luafile " .. CONFIG_PATH .. "/kv-config.lua")

-- Colorscheme
require "colors"

-- load all plugins
require "pluginList"
require "settings"
require "plugins.bufferline"

-- Keybindings
require "mappings"

require("utils").hideStuff()