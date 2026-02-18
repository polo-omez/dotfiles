vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

--Navigate vim panes
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

vim.opt.nu = true -- enable line numbers
vim.opt.relativenumber = true -- enable relative lines
vim.opt.scrolloff = 10 -- forzar 10 lineas siempre por debajo del cursor
vim.opt.updatetime = 300
-- Sincronizar portapapeles de sistema con el de nvim
-- Esto permite que 'y' copie al sistema y 'p' pegue desde él
vim.opt.clipboard = "unnamedplus"

-- Eliminar el resaltado
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		-- Cambia el color de fondo (bg) y el de texto (fg)
		-- Puedes usar nombres de colores ("Red", "Yellow") o códigos Hex ("#3c3836")

		local highlight_color = "#3c3836" -- Un gris oscuro tipo Gruvbox
		-- local highlight_color = "#45403d" -- Un poco más claro

		vim.api.nvim_set_hl(0, "LspReferenceText", { bg = highlight_color, bold = true })
		vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = highlight_color, bold = true })
		vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = highlight_color, bold = true, underline = true })
	end,
})
