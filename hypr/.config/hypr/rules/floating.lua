local terminalFloats = { "^(top)$", "^(btm)$", "^(htop)$" }
for _, t in ipairs(terminalFloats) do
	hl.window_rule({ match = { class = "^(" .. terminal .. ")$", title = t }, float = true })
end

hl.window_rule({ match = { class = "^([Tt]hunar)$", title = "^(Rename.*)$" }, float = true })

local floatClasses = {
	"^([Ss]team)$",
	"^(VirtualBox.*)$",
	"^(org.gnome.FileRoller)$",
	"^(waypaper)$",
	"^(xdg-desktop-portal-gtk|qt[56]ct|nwg-look|nwg-displays|gnome-calculator)$",
	"^(org.pulseaudio.pavucontrol|blueman-manager|nm-connection-editor|mpv|com.github.wwmm.easyeffects)$",
	"^(org.Waytrogen.Waytrogen|waytrogen)$",
	"^(com.github.unrud.VideoDownloader)$",
	"^(com.interversehq.qView)$",
}
for _, c in ipairs(floatClasses) do
	hl.window_rule({ match = { class = c }, float = true })
end
