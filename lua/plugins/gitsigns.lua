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

				local function map(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
				end

				-- navigate changes
				map("n", "nh", gs.next_hunk)
				map("n", "ph", gs.prev_hunk)

				-- Preview / stage / discard
				map("n", "<leader>vh", gs.preview_hunk)
				map("n", "<leader>rh", gs.reset_hunk)
				map("n", "<leader>sh", gs.stage_hunk)
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
