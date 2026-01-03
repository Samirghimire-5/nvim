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
}
