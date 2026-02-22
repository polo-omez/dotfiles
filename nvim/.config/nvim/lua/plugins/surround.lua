return {
	"echasnovski/mini.surround",
	version = "*", -- Recomendado por el autor para usar la versión estable
	opts = {
		-- Aquí va exactamente la configuración que me pasaste
		custom_surroundings = nil,
		highlight_duration = 500,

		mappings = {
			add = "sa", -- Añadir (Normal y Visual)
			delete = "sd", -- Borrar
			find = "ss", -- Encontrar (derecha)
			find_left = "sS", -- Encontrar (izquierda)
			highlight = "sh", -- Resaltar
			replace = "sr", -- Reemplazar

			suffix_last = "l",
			suffix_next = "n",
		},

		n_lines = 20,
		respect_selection_type = false,
		search_method = "cover",
		silent = false,
	},
}
