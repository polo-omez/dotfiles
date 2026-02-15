return {
	"nvimdev/dashboard-nvim",
	lazy = false,
	opts = function()
		local logo = [[ 

 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 

		]]

		logo = string.rep("\n", 4) .. logo .. "\n"

		local opts = {
			theme = "doom",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
                -- stylua: ignore
                center = {
                    -- Usamos 'Telescope find_files' en lugar de LazyVim.pick()
                    { action = 'Telescope find_files',                           desc = " Find File",       icon = " ", key = "f" },
                    -- Usamos 'Telescope oldfiles' para archivos recientes
                    { action = 'Telescope oldfiles',                             desc = " Recent Files",    icon = " ", key = "r" },
                    -- Usamos 'Telescope live_grep' para buscar texto
                    { action = 'Telescope live_grep',                            desc = " Find Text",       icon = " ", key = "g" },
                    -- Usamos 'persistence' directamente si lo tienes instalado
                   -- { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
                    -- Abrimos el gestor Lazy estándar en lugar de LazyExtras
                    { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
                    -- Abrir mason
                    { action = "Mason",                                           desc = " Mason",            icon = " ", key = "m" },
                    -- Salir de Neovim
                    { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
                },
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
				end,
			},
		}

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 40 - #button.desc)
			button.key_format = "  %s"
		end

		-- open dashboard after closing lazy
		if vim.o.filetype == "lazy" then
			vim.api.nvim_create_autocmd("WinClosed", {
				pattern = tostring(vim.api.nvim_get_current_win()),
				once = true,
				callback = function()
					vim.schedule(function()
						vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
					end)
				end,
			})
		end

		return opts
	end,
}
