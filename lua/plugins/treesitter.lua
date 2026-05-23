return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			ensure_installed = {
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"lua",
			},
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
		})
	end,
}
