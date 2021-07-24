local ts_config = require("nvim-treesitter.configs")

ts_config.setup({
	ensure_installed = Sv.treesitter.ensure_installed,
	ignore_installed = Sv.treesitter.ignore_install,
	highlight = Sv.treesitter.highlight,
	indent = {
		enable = true,
	},
})

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
	install_info = {
		url = "https://github.com/vhyrro/tree-sitter-norg",
		files = { "src/parser.c" },
		branch = "main",
	},
}
