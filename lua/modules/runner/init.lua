local term

-- selene: allow(undefined_variable)
if packer_plugins and packer_plugins["nvim-toggleterm.lua"] then
	term = require("toggleterm.terminal").Terminal
else
	print("Star runner needs toggleterm plugin, please uncomment the 'terminal' entry in your starrc")
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

-- will open a Python3 REPL
M.start_repl = function()
	local filetype = vim.bo.filetype
	local repl_cmd = languages[filetype]

	local opened_repl, err = pcall(function()
		if repl_cmd then
			local repl = term:new({ cmd = repl_cmd, hidden = true })
			repl:open()
		else
			print("There is no REPL for " .. filetype .. ". Maybe it is not yet supported in the Star runner plugin?")
		end
	end)

	if not opened_repl then
		print("Error while trying to opening a repl for " .. filetype .. ". Traceback:\n" .. err)
	end
end

-- run_code runs the current file
M.run_code = function()
	local filetype = vim.bo.filetype
	local lang_bin = languages[filetype]

	local run_code, err = pcall(function()
		if lang_bin then
			require("toggleterm").exec_command('cmd="' .. lang_bin .. ' %"', 1)
		else
			print(
				"There is no available executable for "
					.. filetype
					.. ". Maybe it is not yet supported in the Star runner plugin?"
			)
		end
	end)

	if not run_code then
		print("Error while trying to run the current file. Traceback:\n" .. err)
	end
end

return M
