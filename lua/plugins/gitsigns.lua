return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "▎" },
				topdelete = { text = "▎" },
				changedelete = { text = "▎" },
			},
			signcolumn = true,
			numhl = false,
			linehl = false,

			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				-- 1.) hunk changes (block of changes)
				-- chunk navigation
					map("n", "<leader>cn", gs.next_hunk, "Next Change")
					map("n", "<leader>cp", gs.prev_hunk, "Prev Change")

					-- chunk actions
					map("n", "<leader>cv", gs.preview_hunk, "Preview Change -- change preview")
					map("n", "<leader>cs", gs.stage_hunk, "Stage Change")
					map("n", "<leader>cr", gs.reset_hunk, "Reset Change")

					-- line actions
					map("n", "<leader>clr", function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line(".") })
					end, "Reset Line")

					map("v", "<leader>csr", function()
						gs.reset_hunk({ vim.fn.line("v"), vim.fn.line(".") })
					end, "Reset Selected lines")
			end,
		})

		-- color schema
		local function set_gitsigns_hl()
			vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#587c0c" })
			vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#0c7d9d" })
			vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#94151b" })
		end

		set_gitsigns_hl()

		--  Reapply after colorscheme change
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = set_gitsigns_hl,
		})
	end,
}
