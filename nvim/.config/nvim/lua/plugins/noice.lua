-- ~/.config/nvim/lua/plugins/noice.lua

return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- Dependência para UI
			"MunifTanjim/nui.nvim",
			-- Dependência para notificações bonitas
			"rcarriga/nvim-notify",
		},
		opts = {
			-- Integração com LSP (para o Noice cuidar da renderização de docs)
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- Integração com nvim-cmp
				},
			},
			-- Presets: Configurações prontas para facilitar
			presets = {
				bottom_search = true, -- Barra de busca (/) fica embaixo (estilo clássico modernizado)
				command_palette = true, -- Linha de comando (:) vira um popup central
				long_message_to_split = true, -- Mensagens longas vão para uma janela dividida (split)
				inc_rename = false, -- (Opcional) Caixa de diálogo para renomear variáveis
				lsp_doc_border = false, -- Adiciona bordas aos docs do LSP
			},
			-- Configuração das Rotas (para ignorar mensagens chatas se quiser)
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written", -- Ignora a mensagem "written" ao salvar arquivo
					},
					opts = { skip = true },
				},
			},
		},
		config = function(_, opts)
			require("noice").setup(opts)

			-- Configuração extra do Notify (fundo transparente ou opaco)
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	},
}
