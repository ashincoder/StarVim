require("core.utils.settings")
local M = {}

function M.reload_config()
	vim.cmd("source ~/.config/nvim/lua/core/config/init.lua")
	vim.cmd("source ~/.config/nvim/sv-config.lua")
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
			"BufWinEnter",
			"*",
			"setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
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
		{ "BufWritePost", "sv-config.lua", "lua require('core.utils').reload_config()" },
		-- { "VimLeavePre", "*", "set title set titleold=" },
	},
})

-- hide line numbers , statusline in specific buffers!
M.hideStuff = function()
	vim.api.nvim_exec(
		[[
   au TermOpen term://* setlocal nonumber
   au TermClose term://* bd!
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
]],
		false
	)
end

return M
