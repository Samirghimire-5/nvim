return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},

		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					file_ignore_patterns = {},
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-v>"] = actions.select_vertical,
							["<C-x>"] = actions.select_horizontal,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<Esc>"] = actions.close,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("ui-select")

			-- Load the harpoon extensions
			telescope.load_extension("harpoon")

			-- Keymaps
			local builtin = require("telescope.builtin")

			-- normal search
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })

			-- search all files like .env, .gitignore etc
			vim.keymap.set("n", "<leader>fa", function()
				require("telescope.builtin").find_files({
					hidden = true,
					no_ignore = true, -- this will show every files inside gitignore
				})
			end, { desc = "Find all files (including ignored)" })

			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

			-- harpoon keymap
			vim.keymap.set("n", "<leader>hm", ":Telescope harpoon marks<CR>", { desc = "Harpoon Marks (Telescope)" })
		end,
	},
}
