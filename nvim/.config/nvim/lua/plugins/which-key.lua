-- ~/.config/nvim/lua/plugins/which-key.lua

return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {
			preset = "helix",
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			wk.add({
				{ "<leader>f", group = "+find", icon = "" }, -- Telescope/Find
				{ "<leader>c", group = "+code", icon = "" }, -- Code
				{ "<leader>e", group = "+explorer", icon = "" }, -- Explorer
				{ "<leader>g", group = "+git", icon = "" }, -- Git
				{ "<leader>b", group = "+tabs", icon = "" }, -- Tabs/Buffer
				{ "<leader>d", group = "+docker", icon = "" }, -- Docker
				{ "<leader>h", group = "+git-hunks", icon = "" }, -- Git Hunks
				{ "<leader>o", group = "+obsidian", icon = "" }, -- Obsidian
				{ "<leader>r", group = "+http", icon = "" }, -- Rest
			})
		end,
	},
}
