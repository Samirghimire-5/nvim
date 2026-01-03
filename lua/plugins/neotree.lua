return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",

		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},

		lazy = false,

		config = function()
			require("neo-tree").setup({
				close_if_last_window = true,

				filesystem = {
					follow_current_file = true,
					use_libuv_file_watcher = true,
					filtered_items = { -- show/hide files
						hide_dotfiles = false,
						hide_gitignored = false,
					},
				},

				window = {
					width = 30,
					mappings = {
						["<space>"] = "toggle_node",
						["<cr>"] = "open",
						["<esc>"] = "close_window",
					},
				},
			})

			-- Keymaps
			vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
			vim.keymap.set("n", "<leader>ft", ":Neotree focus<CR>", { desc = "Focus Neo-tree" })
			-- vim.keymap.set("n", "<leader>,", "<c-w>p", { desc = "Focus Editor" })
			vim.keymap.set("n", "<leader>bf", ":Neotree buffers<CR>", { desc = "Buffer list" })
			vim.keymap.set("n", "<leader>gs", ":Neotree git_status<CR>", { desc = "Git status" })
		end,
	},
}
