-- ~/.config/nvim/lua/plugins/dashboard.lua

return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("dashboard").setup({
				theme = "hyper", -- Tema moderno e minimalista
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " Settings",
							group = "Number",
							action = "Telescope find_files cwd=~/.dotfiles/nvim/.config/nvim",
							key = "s",
						},
					},
				},
			})
		end,
	},
}
