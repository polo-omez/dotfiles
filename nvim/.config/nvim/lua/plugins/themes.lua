return {
	{ -- 1. Gruvbox (Tu tema por defecto)
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		name = "gruvbox",
		config = function()
			require("gruvbox").setup({
				terminal_colors = true,
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				inverse = true,
				contrast = "",
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
		end,
	},

	{ -- 2. Abstract-cs (Disponible para cambiar)
		"Abstract-IDE/Abstract-cs",
		lazy = false,
		priority = 1000,
	},

	{ -- 3. Cosec Twilight (NUEVO: Disponible para cambiar)
		"CosecSecCot/cosec-twilight.nvim",
		lazy = false,
		priority = 1000,
		dependencies = {
			"rktjmp/lush.nvim", -- Añadimos el motor Lush como dependencia
		},

		config = function()
			vim.cmd("colorscheme cosec-twilight")
		end,
	},
}
