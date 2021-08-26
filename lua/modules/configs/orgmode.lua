local M = {}

M.config = function()
	local status_ok, orgmode = pcall(require, "orgmode")
	if not status_ok then
		return
	end
	orgmode.setup({
		org_agenda_files = { "~/Org/*" },
	})
end

M.bullets = function()
	local status_ok, bullets = pcall(require, "org-bullets")
	if not status_ok then
		return
	end
	bullets.setup({
		symbols = { "◉", "○", "✸", "✿" },
	})
end

return M
