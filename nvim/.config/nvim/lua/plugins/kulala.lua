return {
	"mistweaverco/kulala.nvim",
	keys = {
		{ "<leader>r", "", desc = "+Rest" },
		{ "<leader>rr", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request" },
		{ "<leader>rt", "<cmd>lua require('kulala').toggle_view()<cr>", desc = "Toggle headers/body" },
		{ "<leader>rp", "<cmd>lua require('kulala').jump_prev()<cr>", desc = "Prev request" },
		{ "<leader>rn", "<cmd>lua require('kulala').jump_next()<cr>", desc = "Next request" },
	},
}
