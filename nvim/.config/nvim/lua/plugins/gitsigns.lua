-- ~/.config/nvim/lua/plugins/gitsigns.lua

return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "▎" },
					change = { text = "▎" },
					delete = { text = "" },
					topdelete = { text = "" },
					changedelete = { text = "▎" },
				},
				-- Atalhos úteis para navegar entre mudanças (hunks)
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns
					local function map(mode, l, r, desc)
						vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
					end

					-- Navegar entre mudanças
					map("n", "]h", gs.next_hunk, "Next Hunk")
					map("n", "[h", gs.prev_hunk, "Prev Hunk")

					-- Ações
					map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
					map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
					map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
					map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
					map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
					map("n", "<leader>hb", function()
						gs.blame_line({ full = true })
					end, "Blame Line")
					map("n", "<leader>hd", gs.diffthis, "Diff This")
				end,
			})
		end,
	},
}
