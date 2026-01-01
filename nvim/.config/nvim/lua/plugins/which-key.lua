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
				{ "<leader>f", group = "find" },
				{ "<leader>c", group = "code" },
				{ "<leader>e", group = "explorer" },
				{ "<leader>g", group = "git" },
				{ "<leader>b", group = "tabs" },
				{ "<leader>d", group = "docker" },
			})
		end,
	},
}
