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
		notes_subdir = "00. Index",
		new_notes_location = "notes_subdir",
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
		ui = {
			enable = false,
		},
	},
	keys = {
		{ "<leader>oo", "<cmd>ObsidianNew<CR>", desc = "To create a new note" },
		{ "<leader>ol", "<cmd>ObsidianFollowLink<CR>", desc = "To follow a note reference under the cursor" },
		{
			"<leader>ot",
			"<cmd>ObsidianNewFromTemplate<CR>",
			desc = "To create a new note from a template in the templates folder",
		},
		{ "<leader>od", "<cmd>ObsidianToday<cr>", desc = "To open/create a new daily note" },
		{ "<leader>oc", "<cmd>ObsidianToggleCheckbox<CR>", desc = "To cycle through checkbox options" },
	},
}
