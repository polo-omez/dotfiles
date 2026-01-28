-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},

		lazy = false,
		opts = {
			filesystem = {
				window = {
					position = "right",
				},
			},
		},
		keys = {
			{
				"<C-e>",
				-- Ya no hace falta poner 'right' en el comando porque lo definimos en opts
				"<cmd>Neotree toggle<cr>",
				desc = "Toggle Neo-tree",
			},
		},
	},
}
