local script = "~/.config/scripts/utils/workspace_action.sh"

-- ==========================================
-- 1. WORKSPACES NUMÉRICOS (Inteligentes por monitor)
-- ==========================================
-- Bucle para los números del 1 al 9
for i = 1, 9 do
	-- Saltar al workspace
	hl.bind(mainMod .. " + " .. i, hl.dsp.exec_cmd(script .. " workspace " .. i))
	-- Mover ventana al workspace y viajar con ella
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.exec_cmd(script .. " movetoworkspace " .. i))
end

hl.workspace_rule({ workspace = "r[11-18]", monitor = mainMonitor })
hl.workspace_rule({ workspace = "10", monitor = mainMonitor, default = true })
hl.workspace_rule({ workspace = "r[2-9]", monitor = secondaryMonitor })
hl.workspace_rule({ workspace = "1", monitor = secondaryMonitor, default = true })

-- ==========================================
-- 2. NAVEGACIÓN CON HJKL
-- ==========================================
-- Mover el foco de workspace/monitor (CTRL + ALT)
hl.bind("CTRL + ALT + H", hl.dsp.exec_cmd(script .. " workspace r-1")) -- Workspace anterior
hl.bind("CTRL + ALT + L", hl.dsp.exec_cmd(script .. " workspace r+1")) -- Workspace siguiente
hl.bind("CTRL + ALT + J", hl.dsp.exec_cmd(script .. " workspace r+1")) -- Workspace anterior
hl.bind("CTRL + ALT + K", hl.dsp.exec_cmd(script .. " workspace r-1")) -- Workspace siguiente

hl.bind("ALT + Tab", hl.dsp.focus({ workspace = "previous_per_monitor" }))

-- Mover ventanas (SUPER + SHIFT)
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd(script .. " movetoworkspace r-1")) -- Ventana a WS anterior
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd(script .. " movetoworkspace r+1")) -- Ventana a WS siguiente
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.exec_cmd(script .. " movetoworkspace r+1")) -- Ventana a WS siguiente
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd(script .. " movetoworkspace r-1")) -- Ventana a WS siguiente

-- ==========================================
-- 3. NAVEGACIÓN EXTRA (Comas, Puntos y Ratón)
-- ==========================================
hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mainMod .. " + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mainMod .. " + SHIFT + mouse_up", hl.dsp.window.move({ workspace = "r+1" }))

-- ==========================================
-- 4. PLUGINS (Hyprswitch, Overview, etc.)
-- ==========================================
hl.bind(
	"ALT + Tab",
	hl.dsp.exec_cmd(
		"hyprswitch gui --monitors="
			.. mainMonitor
			.. " --mod-key alt --key tab --close mod-key-release --reverse-key=mod=shift --sort-recent && hyprswitch dispatch"
	)
)

-- Nuevo Overview
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("qs ipc -c overview call overview toggle"))

-- Submapa antiguo de Hyprtasking (lo mantengo por si aún lo usas como fallback)
hl.define_submap("overview_mode", function()
	hl.bind("L", hl.dsp.exec_cmd("hyprctl dispatch hyprtasking:move right"), { repeating = true })
	hl.bind("H", hl.dsp.exec_cmd("hyprctl dispatch hyprtasking:move left"), { repeating = true })
	hl.bind("K", hl.dsp.exec_cmd("hyprctl dispatch hyprtasking:move up"), { repeating = true })
	hl.bind("J", hl.dsp.exec_cmd("hyprctl dispatch hyprtasking:move down"), { repeating = true })

	local reset_overview = function()
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dispatch hyprtasking:toggle all"))
		hl.dispatch(hl.dsp.submap("reset"))
	end

	hl.bind(mainMod .. " + Tab", reset_overview)
	hl.bind("escape", reset_overview)
	hl.bind("return", reset_overview)
end)
