return {
	"mrjones2014/smart-splits.nvim",
	event = "VeryLazy",
	config = function()
		local ss = require("smart-splits")

		ss.setup({
			ignored_buftypes = { "nofile", "quickfix", "prompt" },
			ignored_filetypes = { "NvimTree", "neo-tree", "TelescopePrompt" },
			default_amount = 3,
			at_edge = "wrap",
		})

		-- Window resize (Alt + hjkl) (terminal must support <M-...>)
		vim.keymap.set("n", "<M-h>", ss.resize_left, { desc = "Resize left" })
		vim.keymap.set("n", "<M-j>", ss.resize_down, { desc = "Resize down" })
		vim.keymap.set("n", "<M-k>", ss.resize_up, { desc = "Resize up" })
		vim.keymap.set("n", "<M-l>", ss.resize_right, { desc = "Resize right" })
	end,
}
