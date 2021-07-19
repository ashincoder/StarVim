-- Disabled by default change it in sv-config.lua
local autosave
if not pcall(function()
	autosave = require("autosave")
end) then
	return
end

autosave.setup({
	enabled = Sv.autosave, -- takes boolean value from init.lua
	execution_message = "autosaved at : " .. vim.fn.strftime("%H:%M:%S"),
	events = { "InsertLeave", "TextChanged" },
	conditions = {
		exists = true,
		filetype_is_not = {},
		modifiable = true,
	},
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 2500,
})
