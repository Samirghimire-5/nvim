return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
			columns = { "icon" },

			float = {
				max_width = 0.8,
				max_height = 0.7,
				border = "rounded",
			},

			keymaps = {
				["<Esc>"] = "actions.close", -- close oil
				["q"] = "actions.close",

				["<CR>"] = "actions.select", -- open file
				["-"] = "actions.parent", -- go up

				["gs"] = "actions.change_sort", -- sort files
				["gx"] = "actions.open_external", -- open outside nvim
				["g."] = "actions.toggle_hidden", -- toggle hidden files
			},
		})

		-- open explorer (cwd)
		vim.keymap.set("n", "<leader>fe", function()
			require("oil").open_float(vim.loop.cwd())
		end, { desc = "Explorer (Oil float)" })

		-- quick parent navigation
		-- vim.keymap.set("n", "<leader>e", "<cmd>oil<CR>", { desc = "Parent directory" })
		vim.keymap.set("n", "<leader>e", function()
			require("oil").open_float()
		end, { desc = "Parent dir float" })

		-- buffer navigation (neo-tree replacement feel)
		vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
		vim.keymap.set("n", "<S-h>", ":bprev<CR>", { desc = "Prev buffer" })
		vim.keymap.set("n", "<leader>bb", "<C-^>", { desc = "Last buffer" })

		vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save / Apply changes" })
	end,
}
