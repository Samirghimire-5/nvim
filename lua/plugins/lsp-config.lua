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
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"pyright",
				"cssls",
				"html",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			-- UI (clean floating windows)
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
				max_width = 80,
				max_height = 20,
			})

			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

			vim.diagnostic.config({
				float = {
					border = "rounded",
					source = "always",
				},
			})

			-- Float colors
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e", fg = "#e5e7eb" })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa", bg = "#1e1e2e" })
			vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#f9fafb", bg = "#1e1e2e", bold = true })

			-- Capabilities (blink compatible)
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Servers
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
						},
					},
				},
				ts_ls = {},
				pyright = {},
				cssls = {},
				html = {},
			}

			for name, config in pairs(servers) do
				config.capabilities = capabilities
				vim.lsp.config(name, config)
				vim.lsp.enable(name)
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
