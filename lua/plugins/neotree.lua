return {
	{
		"nvim-neo-tree/neo-tree.nvim",
    enabled = false,
		branch = "v3.x",

		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},

		lazy = false,

		config = function()
			require("neo-tree").setup({
				close_if_last_window = false,

				popup_border_style = "rounded",
				enabled_git_status = true,
				enabled_diagnostics = true,

				filesystem = {
					follow_current_file = {
						enabled = true,
					},
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

						["f"] = "none",
						["F"] = "fuzzy_finder", -- finder(global serarch) in neotree

						["<leader>fe"] = function() -- this will switch focus to editor
							vim.cmd("wincmd p")
						end,
					},
				},
			})

			-- Utility: resize Neo-tree window safely
			local function resize_neotree(delta)
				for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
					local buf = vim.api.nvim_win_get_buf(win)
					local ft = vim.bo[buf].filetype

					if ft == "neo-tree" then
						local width = vim.api.nvim_win_get_width(win)
						vim.api.nvim_win_set_width(win, math.max(20, width + delta))
						return
					end
				end
			end

			-- Keymaps
			vim.keymap.set("n", "<S-f>", ":Neotree search<CR>", { desc = "Search inside neo tree" })
			vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
			-- focus neotree (left sidebar of files)
			vim.keymap.set("n", "<leader>ft", ":Neotree focus<CR>", { desc = "Focus Neo-tree" })

			vim.keymap.set("n", "<leader>bf", ":Neotree buffers<CR>", { desc = "Buffer list" })
			vim.keymap.set("n", "<leader>gs", ":Neotree git_status<CR>", { desc = "Git status" })

			-- buffer navigation
			vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Buffer Next" })
			vim.keymap.set("n", "<S-h>", ":bprev<CR>", { desc = "Buffer Prev" })

			-- toogle last open file
			vim.keymap.set("n", "<leader>bb", "<C-^>", { desc = "Toogle last file" })

			-- increase/decrease sidebar width
			vim.keymap.set("n", "<leader>tw", function()
				resize_neotree(5)
			end)
			vim.keymap.set("n", "<leader>tn", function()
				resize_neotree(-5)
			end)

			-- if only Neo-tree remains → exit Neovim
			vim.api.nvim_create_autocmd("BufEnter", {
				nested = true,
				callback = function()
					if #vim.api.nvim_list_wins() == 1 then
						local buf = vim.api.nvim_get_current_buf()
						if vim.bo[buf].filetype == "neo-tree" then
							vim.cmd("quit")
						end
					end
				end,
			})
		end,
	},
}
