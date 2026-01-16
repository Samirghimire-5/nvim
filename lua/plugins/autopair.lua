return {
	{
		-- eg: if you type ( it will autopair () like this
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" }, -- doesn't works when typing filename in telescope
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"html",
					"css",
					"javascript",
					"typescript",
					"tsx",
					"lua",
				},
				highlight = { enable = true },

				autotag = {
					enable = true,
				},
			})
		end,
	},
}
