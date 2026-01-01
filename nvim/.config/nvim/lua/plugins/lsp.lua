-- ~/.config/nvim/lua/plugins/lsp.lua

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"html",
					"cssls",
					"pyright",
					"rust_analyzer",
				},

				automatic_installation = true,

				handlers = {
					function(server_name)
						local capabilities = cmp_nvim_lsp.default_capabilities()
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end,
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local keymap = vim.keymap.set

					keymap("n", "<leader>cd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Ir para Definição" })
					keymap("n", "<leader>ch", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Ver Documentação" })
					keymap("n", "<leader>cr", vim.lsp.buf.references, { buffer = ev.buf, desc = "Ver Referências" })
					keymap("n", "<leader>cn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Renomear Variável" })
					keymap("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Ações de Código" })
					keymap("n", "<leader>cf", vim.lsp.buf.references, { buffer = ev.buf, desc = "Formatar Arquivo" })
				end,
			})
		end,
	},
}
