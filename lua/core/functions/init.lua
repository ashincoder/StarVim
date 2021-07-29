local utils = require("utils")

local M = {}

function M.reload_config()
	vim.cmd("source ~/.config/nvim/lua/core/config/init.lua")
	vim.cmd("source ~/.config/nvim/sv-config.lua")
	vim.cmd("source ~/.config/nvim/starplug.lua")
	vim.cmd("source ~/.config/nvim/lua/modules/init.lua")
	vim.cmd(":PackerInstall")
	vim.cmd(":PackerCompile")
end

function M.search_dotfiles()
	require("telescope.builtin").find_files({
		prompt_title = "< Neovim Dotfiles >",
		cwd = "~/.config/nvim",
	})
end

-- check_plugin checks if the given plugin exists
-- @tparam string plugin_name The plugin name, e.g. nvim-tree.lua
-- @tparam string path Where should be searched the plugin in packer's path, defaults to `start`
-- @return bool
M.check_plugin = function(plugin_name, path)
	if not path then
		path = "start"
	end

	return vim.fn.isdirectory(vim.fn.stdpath("data") .. "/site/pack/packer/" .. path .. "/" .. plugin_name) == 1
end

-- is_plugin_disabled checks if the given plugin is disabled in doomrc
-- @tparam string plugin The plugin identifier, e.g. statusline
-- @return bool
M.is_plugin_disabled = function(plugin)
	local starrc = require("core.config.starrc").load_starrc()

	-- Iterate over all starrc sections (e.g. ui) and their plugins
	for _, section in pairs(starrc) do
		if utils.has_value(section, plugin) then
			return false
		end
	end

	return true
end

-- hide line numbers , statusline in specific buffers!
function M.hideStuff()
	vim.api.nvim_exec(
		false,
		[[
   au TermOpen term://* setlocal nonumber
   au TermClose term://* bd!
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
]]
	)
end

return M
