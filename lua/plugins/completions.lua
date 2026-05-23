return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},

		config = function(_, opts)
			local cmp = require("blink.cmp")

			-- Ensure LuaSnip is fully loaded and filetypes are mapped
			local ls = require("luasnip")
			ls.filetype_extend("javascriptreact", { "javascript" })
			ls.filetype_extend("typescript", { "javascript" })
			ls.filetype_extend("typescriptreact", { "typescript", "javascriptreact", "javascript" })

			-- Load snippets from friendly-snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			-- Start blink.cmp
			cmp.setup(opts)

			-- Safety net: always hide completion/signature floats when leaving insert/buffer
			vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave" }, {
				callback = function()
					pcall(function()
						cmp.hide()
						cmp.hide_documentation()
						cmp.hide_signature()
					end)
				end,
			})
		end,

		opts = {
			-- 🔑 Keymaps
			keymap = {
				preset = "enter",
				-- More reliable "close" behavior when previews/signature are active
				["<C-q>"] = { "cancel", "fallback" },
				["<Esc>"] = { "cancel", "fallback" },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			},

			snippets = { preset = "luasnip" },

			appearance = {
				nerd_font_variant = "mono",
			},

			signature = {
				enabled = true,
				window = {
					show_documentation = false,
				},
			},

			completion = {
				ghost_text = { enabled = true },

				-- The `enter` keymap preset recommends disabling preselect to avoid odd
				-- “stuck menu / preview” behavior.
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},
				-- Removed invalid trigger key that might crash blink.cmp validation
				trigger = {
					show_on_trigger_character = true,
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},

				menu = {
					auto_show = true,
					scrollbar = false,

					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", gap = 1 },
							{ "kind", gap = 1 },
							{ "detail", gap = 1 },
						},

						components = {
							detail = {
								text = function(ctx)
									-- ctx.item.detail usually contains the "Auto import from..." info
									local detail = ctx.item.detail or ""
									if detail ~= "" then
										-- Shorten the text if it's too long
										if #detail > 30 then
											detail = detail:sub(1, 27) .. "..."
										end
										return detail
									end
									-- Fallback to source name if no detail exists
									return "[" .. ctx.source_name .. "]"
								end,
								highlight = "BlinkCmpLabelDescription", -- Use the faded highlight group
							},
							kind_icon = {
								text = function(ctx)
									local icons = {
										-- Languages
										Javascript = "",
										TypeScript = "",
										React = "",
										HTML = "",
										CSS = "",
										JSON = "",
										Lua = "",

										-- LSP kinds
										Function = "λ",
										Method = "∂",
										Variable = "󰀫",
										Field = "󰀫",
										Property = "󰀫",
										Class = "ﴯ",
										Interface = "",
										Module = "⌠",
										Keyword = "k",
										Constructor = "∑",
										Enum = "τ",
										EnumMember = "τ",
										Snippet = "⊂",
										Text = "τ",
									}

									return icons[ctx.kind] or ctx.kind_icon
								end,
							},

							kind = {
								text = function(ctx)
									return ctx.kind
								end,
							},

							source_name = {
								text = function(ctx)
									local map = {
										lsp = "[LSP]",
										buffer = "[Buffer]",
										path = "[Path]",
									}
									return map[ctx.source_name] or ctx.source_name
								end,
							},
						},
					},
				},
			},

			sources = {
				default = { "lsp", "path", "buffer", "snippets" },
			},

			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},
	},
}
