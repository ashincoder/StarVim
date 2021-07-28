local log = require("core.logging")
local term

-- selene: allow(undefined_variable)
if packer_plugins and packer_plugins["nvim-toggleterm.lua"] then
	term = require("toggleterm.terminal").Terminal
else
	log.error("runner needs toggleterm plugin, please uncomment the 'terminal' entry in your starrc")
end

local M = {}

-- Currently supported languages,
-- filetype → binary to execute
local languages = {
	vlang = "v",
	lua = "lua",
	ruby = "ruby",
	python = "python3",
	javascript = "node",
	typescript = "ts-node",
}

-- start_repl starts a REPL for the current filetype, e.g. a Python file
-- will open a Python3 REPL
M.start_repl = function()
	local filetype = vim.bo.filetype
	local repl_cmd = languages[filetype]

	local opened_repl, err = pcall(function()
		if repl_cmd then
			local repl = term:new({ cmd = repl_cmd, hidden = true })
			repl:open()
		else
			log.error("There is no REPL for " .. filetype .. ". Maybe it is not yet supported in the runner plugin?")
		end
	end)

	if not opened_repl then
		log.error("Error while trying to opening a repl for " .. filetype .. ". Traceback:\n" .. err)
	end
end

return M
