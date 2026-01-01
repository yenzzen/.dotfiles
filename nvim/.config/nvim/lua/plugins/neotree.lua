-- ~/.config/nvim/lua/plugins/neotree.lua

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "<leader>ee", ":Neotree focus<CR>", desc = "Open" },
			{ "<leader>ec", ":Neotree close<CR>", desc = "Close" },
		},
		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,
				window = {
					position = "left",
					width = 30,
				},
				filesystem = {
					hijack_netrw_behavior = "open_default",
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
						hide_gitignored = false,
					},
					follow_current_file = {
						enabled = true,
					},
				},
			})
		end,
	},
}
