local M = {}

function M.define_augroups(definitions) -- {{{1
	for group_name, definition in pairs(definitions) do
		vim.cmd("augroup " .. group_name)
		vim.cmd("autocmd!")

		for _, def in pairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
			vim.cmd(command)
		end

		vim.cmd("augroup END")
	end
end

M.define_augroups({

	_user_autocommands = Sv.user_autocommands,
	_general_settings = {
		{
			"TextYankPost",
			"*",
			"lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})",
		},
		{
			"BufRead",
			"*",
			"setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
		},
		{
			"BufNewFile",
			"*",
			"setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
		},
		{ "BufWritePost", "sv-config.lua", "lua require('core.functions').reload_config()" },
		{
			"TextChanged,InsertLeave",
			"<buffer>",
			"silent! write",
		},
	},
})

-- file extension specific tabbing
vim.cmd([[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])

return M
