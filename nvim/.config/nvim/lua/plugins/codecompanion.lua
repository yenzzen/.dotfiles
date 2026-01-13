return {
	"olimorris/codecompanion.nvim",
	version = "^18.0.0",
	opts = {
		display = {
			chat = {
				window = {
					layout = "vertical",
					position = "right",
					width = 0.45,
				},
			},
		},
		interactions = {
			chat = {
				adapter = "copilot",
				default_rules = "default",
			},
			inline = {
				adapter = "copilot",
			},
			cmd = {
				adapter = "copilot",
			},
			background = {
				adapter = "copilot",
			},
		},
	},
	rules = {
		default = {
			description = "Default rules for Code Companion",
			files = {
				"AGENTS.md",
			},
			is_preset = true,
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>cc", "<cmd>CodeCompanion chat<cr>", desc = "Code Companion Chat" },
	},
}
