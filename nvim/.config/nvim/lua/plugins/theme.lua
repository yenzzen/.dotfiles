-- ~/.config/nvim/lua/plugins/theme.lua

return {
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Carregar antes de tudo
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}
