-- ~/.config/nvim/lua/plugins/obsidian.lua

return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		workspaces = {
			{
				name = "vault",
				path = "~/Documents/Obsidian",
			},
		},
		daily_notes = {
			folder = "01. Daily",
			date_format = "%Y-%m-%d",
			template = "daily_habits.md",
		},
		templates = {
			folder = "99. System",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},
		mapping = {
			["<leader>ol"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["<leader>oc"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
		},
	},
	keys = {
		{ "<leader>oo", "<cmd>ObsidianToday<cr>", desc = "Habit Tracker" },
	},
}
