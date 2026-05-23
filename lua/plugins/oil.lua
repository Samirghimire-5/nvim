return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,

			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},

			columns = { "icon" },
			view_options = {
				show_hidden = true,
			},

			-- ui
			float = {
				max_width = 0.8,
				max_height = 0.7,
				border = "rounded",
			},

			use_default_keymaps = true,

			keymaps = {
				["<Esc>"] = "actions.close",
				["q"] = "actions.close",
				["<C-c>"] = { "actions.close", mode = "n" },

				["<CR>"] = "actions.select",
				-- Split-open helpers (keep Ctrl-h/j/k/l free for window navigation)
				["s"] = { "actions.select", opts = { horizontal = true } },
				["v"] = { "actions.select", opts = { vertical = true } },
				["t"] = { "actions.select", opts = { tab = true } },
				["p"] = "actions.preview",
				["<C-h>"] = false,
				["<C-l>"] = false,
				["-"] = "actions.parent",

				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
			},
		})

		-- Open Oil in current working directory
		vim.keymap.set("n", "<leader>e", function()
			require("oil").open_float()
		end, { desc = "Parent dir float" })

		-- Open oil in current working directory
		vim.keymap.set("n", "<leader>fe", function()
			require("oil").open_float(vim.fn.getcwd())
		end, { desc = "Explorer (cwd)" })

		-- Buffer navigation
		vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
		vim.keymap.set("n", "<S-h>", ":bprev<CR>", { desc = "Prev buffer" })
		vim.keymap.set("n", "<leader>bb", "<C-^>", { desc = "Last buffer" })

		-- Save
		vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save / Apply changes" })
	end,
}
