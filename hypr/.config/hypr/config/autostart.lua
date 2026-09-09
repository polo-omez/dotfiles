hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	hl.exec_cmd("waybar")
	--hl.exec_cmd(
	--		"hyprswitch init --show-title --size-factor 3 --workspaces-per-row 4 --custom-css ~/.config/hypr/config/hyprswitch.css"
	--	)
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("hyprpm reload -n")
	hl.exec_cmd("hyprctl setcursor " .. cursorTheme .. " 16")
	hl.exec_cmd("qs -c overview")
end)
