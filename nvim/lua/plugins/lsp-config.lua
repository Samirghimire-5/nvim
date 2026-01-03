return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"pyright",
				"cssls",
				"html",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- CAPABILITIES:
			-- This tells the Language Servers what Neovim is capable of.
			-- By adding 'cmp_nvim_lsp', we tell the server: "Hey, I have a completion engine,
			-- so send me snippet and popup data!"
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- LUA SPECIFIC CONFIG:
			-- We configure 'lua_ls' separately because it needs to know that 'vim'
			-- is a global variable (otherwise it shows "undefined global" warnings).
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- GENERAL SERVER CONFIG:
			-- A loop to apply the same basic capabilities to all other servers.
			local servers = { "ts_ls", "pyright", "cssls", "html" }

			for _, server in ipairs(servers) do
				vim.lsp.config(server, {
					capabilities = capabilities,
				})
			end

			-- Finally, enable them all
			local all_servers = { "lua_ls", "ts_ls", "pyright", "cssls", "html" }
			for _, server in ipairs(all_servers) do
				vim.lsp.enable(server)
			end

			-- Keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
