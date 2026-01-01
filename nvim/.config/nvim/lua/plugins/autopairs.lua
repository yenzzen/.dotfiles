-- ~/.config/nvim/lua/plugins/autopairs.lua

return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter", -- Carrega assim que começa a digitar
		dependencies = { "hrsh7th/nvim-cmp" }, -- Integração com o menu de autocomplete
		config = function()
			local autopairs = require("nvim-autopairs")

			autopairs.setup({
				check_ts = true, -- Usa o Treesitter para não fechar pares onde não deve (ex: dentro de comentários)
				ts_config = {
					lua = { "string" }, -- Não adicionar pares em nós do tipo 'string' em lua
					javascript = { "template_string" }, -- Nem em template strings do JS
				},
				disable_filetype = { "TelescopePrompt", "spectre_panel" }, -- Desliga no terminal do telescope
				fast_wrap = {
					map = "<M-e>", -- Atalho para envolver palavra (opcional)
					chars = { "{", "[", "(", '"', "'" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					offset = 0, -- Offset from pattern match
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
			})

			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")

			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
