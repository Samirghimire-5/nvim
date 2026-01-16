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

				-- 1.) hunk changes (block of changes)
				-- navigate changes
				map("n", "<leader>hn", gs.next_hunk)
				map("n", "<leader>hp", gs.prev_hunk)
				-- Preview / stage / discard
				map("n", "<leader>gp", gs.preview_hunk) -- g = git
				map("n", "<leader>hs", gs.stage_hunk) -- hs - cause gs command already does git status
				map("n", "<leader>hr", gs.reset_hunk)

				-- 2.) line changes (single line change)
				map("n", "<leader>rl", function() -- reset single line
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line(".") })
				end)
				map("v", "<leader>rl", function() -- reset selected lines
					gs.reset_hunk({ vim.fn.line("v"), vim.fn.line(".") })
				end)
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
