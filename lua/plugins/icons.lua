local M = {}

M.config = function()
	require("nvim-web-devicons").setup({
		override = {
			org = {
				icon = "",
				name = "org",
			},
			html = {
				icon = "",
				name = "html",
			},
			css = {
				icon = "",
				name = "css",
			},
			js = {
				icon = "",
				name = "js",
			},
			ts = {
				icon = "ﯤ",
				name = "ts",
			},
			kt = {
				icon = "󱈙",
				name = "kt",
			},
			png = {
				icon = "",
				name = "png",
			},
			jpg = {
				icon = "",
				name = "jpg",
			},
			jpeg = {
				icon = "",
				name = "jpeg",
			},
			mp3 = {
				icon = "",
				name = "mp3",
			},
			mp4 = {
				icon = "",
				name = "mp4",
			},
			out = {
				icon = "",
				name = "out",
			},
			Dockerfile = {
				icon = "",
				name = "Dockerfile",
			},
			rb = {
				icon = "",
				name = "rb",
			},
			vue = {
				icon = "﵂",
				name = "vue",
			},
			py = {
				icon = "",
				name = "py",
			},
			toml = {
				icon = "",
				name = "toml",
			},
			lock = {
				icon = "",
				name = "lock",
			},
			zip = {
				icon = "",
				name = "zip",
			},
			xz = {
				icon = "",
				name = "xz",
			},
			deb = {
				icon = "",
				name = "deb",
			},
			rpm = {
				icon = "",
				name = "rpm",
			},
			lua = {
				icon = "",
				name = "lua",
			},
		},
	})
end

return M
