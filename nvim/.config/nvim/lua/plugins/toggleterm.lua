-- ~/.config/nvim/lua/plugins/toggleterm.lua

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 20, -- Tamanho do terminal quando aberto na horizontal/vertical
				open_mapping = [[<C-\>]], -- O atalho MÁGICO: Ctrl + \ (basta apertar uma vez para abrir/fechar)
				hide_numbers = true, -- Esconde números de linha no terminal
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2, -- Escurece o fundo do terminal para diferenciar do editor
				start_in_insert = true, -- Já entra podendo digitar
				insert_mappings = true, -- Permite usar Ctrl+n/p dentro do terminal
				persist_size = true,
				direction = "float", -- "float" (flutuante), "horizontal" ou "vertical"
				close_on_exit = true, -- Fecha a janela se der 'exit'
				shell = vim.o.shell, -- Usa o shell padrão do seu sistema (zsh/bash)
				float_opts = {
					border = "curved", -- Borda arredondada bonita
					winblend = 0,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

			function _lazygit_toggle()
				lazygit:toggle()
			end

			vim.keymap.set(
				"n",
				"<leader>gg",
				"<cmd>lua _lazygit_toggle()<CR>",
				{ noremap = true, silent = true, desc = "Abrir LazyGit" }
			)

			local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })

			function _lazydocker_toggle()
				lazydocker:toggle()
			end

			vim.keymap.set(
				"n",
				"<leader>dd",
				"<cmd>lua _lazydocker_toggle()<CR>",
				{ noremap = true, silent = true, desc = "Docker (LazyDocker)" }
			)
		end,
	},
}
