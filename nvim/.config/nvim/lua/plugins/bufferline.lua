return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({})
		vim.keymap.set("n", "<Leader><Tab>", "<cmd>e #<cr>", { desc = "Cycle tab" })
		vim.keymap.set("n", "<C-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous tab" })
		vim.keymap.set("n", "<C-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab" })
		vim.keymap.set("n", "<C-x>", "<cmd>bdelete<cr>", { desc = "Close tab" })
	end,
}
