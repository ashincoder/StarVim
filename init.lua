-- Store startup time in seconds
vim.g.start_time = vim.fn.reltime()

-- Temporarily disable shada file to improve performance
vim.opt.shadafile = "NONE"

-- Disable some unused built-in Neovim plugins
local disabled_built_ins = {
	"netrw",
	"gzip",
	"zip",
	"netrwPlugin",
	"netrwSettings",
	"tar",
	"tarPlugin",
	"netrwFileHandlers",
	"zipPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

-- Disable these for very fast startup time
vim.cmd([[
	filetype off
  filetype plugin indent off
]])

require("core")

local async
async = vim.loop.new_async(vim.schedule_wrap(function()
	local status_ok, _ = pcall(vim.cmd, "luafile " .. CONFIG_PATH .. "/sv-config.lua")
	if not status_ok then
		print("something is wrong with your sv-config")
	end
	local compiled_plugins_path = vim.fn.expand("$HOME/.config/nvim/plugin/packer_compiled.lua")
	if vim.fn.filereadable(compiled_plugins_path) > 0 then
		-- If the current buffer name is empty then trigger Dashboard
		if vim.api.nvim_buf_get_name(0):len() == 0 then
			vim.cmd("Dashboard")
		end
	end
	vim.opt.shadafile = ""
	vim.defer_fn(function()
		vim.cmd([[
                rshada!
                doautocmd BufRead
                filetype on
                filetype plugin indent on
                silent! bufdo e
            ]])
	end, 15)
	async:close()
end))
async:send()
