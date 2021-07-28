local M = {}

M.star_root = vim.fn.expand("$HOME/.config/nvim")
M.star_logs = DATA_PATH .. "/star.log"

-- mappings wrapper, extracted from
M.map = function(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Check if string is empty or if it's nil
-- @return bool
M.is_empty = function(str)
	return str == "" or str == nil
end

-- Search if a table have the value we are looking for,
-- useful for plugins management
M.has_value = function(tabl, val)
	for _, value in ipairs(tabl) do
		if value == val then
			return true
		end
	end

	return false
end

return M
