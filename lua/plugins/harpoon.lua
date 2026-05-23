return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
			ui = {
				border = "rounded",
			},
		})

		local list = harpoon:list()

		-- mark files
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Harpoon add file" })

		-- Toggle UI menu
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(list)
		end, { desc = "Harpoon menu" })

		-- Quick jump
		vim.keymap.set("n", "<leader>1", function()
			list:select(1)
		end, { desc = "Harpoon file 1" })
		vim.keymap.set("n", "<leader>2", function()
			list:select(2)
		end, { desc = "Harpoon file 2" })
		vim.keymap.set("n", "<leader>3", function()
			list:select(3)
		end, { desc = "Harpoon file 3" })
		vim.keymap.set("n", "<leader>4", function()
			list:select(4)
		end, { desc = "Harpoon file 4" })

		-- Cycle
		vim.keymap.set("n", "<leader>hf", function()
			list:next()
		end, { desc = "Harpoon next" })
		vim.keymap.set("n", "<leader>hb", function()
			list:prev()
		end, { desc = "Harpoon previous" })
	end,
}
