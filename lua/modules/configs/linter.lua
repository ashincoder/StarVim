local status_ok, _ = pcall(require, "lint")
if not status_ok then
	return
end

if not Sv.lint_on_save then
	vim.cmd([[if exists('#autolint#BufWritePost')
	:autocmd! autolint
	endif]])
end
