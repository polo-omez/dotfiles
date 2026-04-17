return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- ¡Importante! La documentación dice explícitamente que ya no soporta lazy-loading
		lazy = false,
		build = ":TSUpdate",
	},
}
