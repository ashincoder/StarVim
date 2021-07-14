local M = {}

M.config = function()
	local g = vim.g
	local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

	g.dashboard_disable_at_vimenter = Sv.plugin.dashboard_disable

	g.dashboard_disable_statusline = Sv.plugin.statusline_disable

	g.dashboard_default_executive = "telescope"

	g.dashboard_custom_header = {

		"███████╗████████╗ █████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
		"██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██║   ██║██║████╗ ████║ ",
		"███████╗   ██║   ███████║██████╔╝██║   ██║██║██╔████╔██║ ",
		"╚════██║   ██║   ██╔══██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║ ",
		"███████║   ██║   ██║  ██║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
		"╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	}

	g.dashboard_custom_section = {
		a = {
			description = { "  Find File                 SPC f f" },
			command = "Telescope find_files",
		},
		b = {
			description = { "  Recents                   SPC f o" },
			command = "Telescope oldfiles",
		},
		c = {
			description = { "  Find Word                 SPC f w" },
			command = "Telescope live_grep",
		},
		d = {
			description = { "洛 New File                  SPC f n" },
			command = "enew",
		},
		e = {
			description = { "  Bookmarks                 SPC b m" },
			command = "Telescope marks",
		},
		f = {
			description = { "  Load Last Session         SPC q l" },
			command = "SessionLoad",
		},
	}

	g.dashboard_custom_footer = {
		"StarVim Loaded " .. plugins_count .. " plugins",
	}
end

return M
