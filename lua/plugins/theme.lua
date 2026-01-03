return {
  -- uncomment this block to apply catppuccin theme
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	lazy = false, -- Load this plugin immediately
	-- 	priority = 1000, -- Load it before all other plugins
	-- 	opts = {
	-- 		-- Set to true to enable setting background to transparent
	-- 		transparent = false, -- Change to true if you want transparency
	-- 		-- Disable setting background and foreground colors in the normal group
	-- 		-- This is useful if you want to keep your terminal's background.
	-- 		disable_background = true,
	-- 	},
	-- 	config = function(_, opts)
	-- 		-- Setup catppuccin with the options defined above
	-- 		require("catppuccin").setup(opts)
	--
	-- 		-- Load the colorscheme
	-- 		vim.cmd([[colorscheme catppuccin]])
	-- 	end,
	-- },
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- dashboard.section.header.val = {
			-- 	[[                                                                  ]],
			-- 	[[    .⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤.                        ]],
			-- 	[[    ⣿ ◢◤      M U L A    S A A G      ◥◣ ⣿                        ]],
			-- 	[[    ⣿ ◥◣      ──────────────────      ◢◤ ⣿                        ]],
			-- 	[[    .⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶.                        ]],
			-- 	[[                                                                  ]],
			-- 	[[    ███╗   ███╗██╗   ██╗██╗      █████╗                           ]],
			-- 	[[    ████╗ ████║██║   ██║██║     ██╔══██╗                          ]],
			-- 	[[    ██╔████╔██║██║   ██║██║     ███████║                          ]],
			-- 	[[    ██║╚██╔╝██║██║   ██║██║     ██╔══██║                          ]],
			-- 	[[    ██║ ╚═╝ ██║╚██████╔╝███████╗██║  ██║                          ]],
			-- 	[[    ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝                          ]],
			-- 	[[                                                                  ]],
			-- 	[[    ███████╗ █████╗  █████╗  ██████╗                              ]],
			-- 	[[    ██╔════╝██╔══██╗██╔══██╗██╔════╝                              ]],
			-- 	[[    ███████╗███████║███████║██║  ███╗                             ]],
			-- 	[[    ╚════██║██╔══██║██╔══██║██║   ██║                             ]],
			-- 	[[    ███████║██║  ██║██║  ██║╚██████╔╝                             ]],
			-- 	[[    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝                              ]],
			-- 	[[                                                                  ]],
			-- 	[[         ░▒▓██  Aau code hana....  ██▓▒░                          ]],
			-- 	[[                                                                  ]],
			-- }

			dashboard.section.header.val = {
				[[                                                                    ]],
				[[    ▟████████████████████████████████████████████████████████████▙    ]],
				[[    ▜      ▒▒▒▒▒▒▒▒▒▒▒  M U L A    S A A G  ▒▒▒▒▒▒▒▒▒▒▒          ▛    ]],
				[[    ▜      ───────────  SYSTEM : ACTIVE ───────────              ▛    ]],
				[[    ▝▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀   ]],
				[[                                                                    ]],
				[[      _  _ _  _ _    ____    ____ ____ ____ ____                ]],
				[[      |\/| |  | |    |__|    [__  |__| |__| | __                ]],
				[[      |  | |__| |___ |  |    ___] |  | |  | |__]                ]],
				[[                                                                    ]],
				[[    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗          ]],
				[[    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║          ]],
				[[    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║          ]],
				[[    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║          ]],
				[[    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║          ]],
				[[    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝          ]],
				[[                                                                    ]],
				[[            ░▒▓██      Aau code hana....      ██▓▒░             ]],
				[[                                                                    ]],
			}

			dashboard.section.buttons.val = {
				dashboard.button("e", "  New File", ":ene <CR>"),
				dashboard.button("f", "󰈞  Find File", ":Telescope find_files<CR>"),
				dashboard.button("r", "󰄉  Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("g", "󰊄  Git", ":Telescope git_status<CR>"),
				dashboard.button("q", "󰩈  Quit", ":qa<CR>"),
			}

			dashboard.section.footer.val = "K xa hajur...."

			-- -------------------------------
			-- ENABLE TRANSPARENT TERMINAL BACKGROUND
			-- -------------------------------
			local function make_transparent(group)
				vim.api.nvim_set_hl(0, group, { bg = "NONE" })
			end

			-- Normal & inactive windows
			make_transparent("Normal")
			make_transparent("NormalNC")

			-- Dashboard sections
			make_transparent("AlphaHeader")
			make_transparent("AlphaButtons")
			make_transparent("AlphaFooter")

			-- -------------------------------
			-- CYBERPUNK NEON COLORS
			-- -------------------------------
			vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#89dceb", bold = true })
			vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#f5c2e7" })
			vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#94e2d5", italic = true })

			-- -------------------------------
			-- CLEAN DASHBOARD (hide statusline & ruler)
			-- -------------------------------
			vim.cmd([[autocmd FileType alpha setlocal laststatus=0 noruler noshowmode]])

			alpha.setup(dashboard.opts)
		end,
	},
}
