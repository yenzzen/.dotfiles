-- ~/.config/nvim/lua/plugins/bufferline.lua

return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Fixar/Desafixar Aba" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Fechar abas não fixadas" },
			{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Fechar outras abas" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Fechar abas à direita" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Fechar abas à esquerda" },
			{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Aba Anterior" },
			{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Próxima Aba" },
		},
		opts = {
			options = {
				-- Integração para não ficar em cima do Neo-tree
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
				diagnostics = "nvim_lsp", -- Mostra erros na aba
				always_show_bufferline = false, -- Esconde se tiver só 1 aba (opcional, mude para true se quiser ver sempre)
				diagnostics_indicator = function(_, _, diag)
					local icons = { Error = " ", Warn = " ", Info = " " }
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
			},
		},
	},
}
