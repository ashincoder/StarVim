-- Load config
require("config")
-- Keybindings
require("mappings")

-- User Config
local status_ok, _ = pcall(vim.cmd, "luafile " .. CONFIG_PATH .. "/sv-config.lua")
if not status_ok then
	print("something is wrong with your sv-config")
end

-- load all plugins
require("plugins")

-- Settings
require("settings")

-- Utils
require("utils").hideStuff()
