hl.window_rule({
	name = "pip-rules",
	match = { class = "^(firefox|google-chrome|zen)$", title = "^.*(Picture-in-Picture|Picture in Picture).*$" },
	float = true,
	pin = true,
	size = { 480, 270 },
	no_blur = true,
	move = { "74.5%", "4.25%" },
	animation = "slide",
	opaque = true,
})

hl.window_rule({ match = { class = "^(mpv)$" }, monitor = mainMonitor })

-- Waydrop Menus
hl.window_rule({
	name = "menu-peaclock",
	match = { class = "^(waydrop-peaclock)$" },
	float = true,
	border_size = 0,
	size = { 450, 250 },
	move = { "(monitor_w*0.5)-225", "40" },
	pin = true,
	animation = "slide top",
})
hl.window_rule({
	name = "menu-btop",
	match = { class = "^(waydrop-btop)$" },
	float = true,
	border_size = 0,
	size = { 900, 600 },
	move = { "(monitor_w)-950", "40" },
	pin = true,
	animation = "slide top",
})
hl.window_rule({
	name = "menu-calcure",
	match = { class = "^(waydrop-calcure)$" },
	float = true,
	border_size = 1,
	size = { 300, 250 },
	move = { "(monitor_w*0.5)-150", "40" },
	pin = true,
	animation = "slide top",
})
hl.window_rule({
	name = "cava-drop-left",
	match = { class = "^(waydrop-cava-left)$" },
	float = true,
	border_size = 1,
	size = { "monitor_w*0.25", "250" },
	move = { "5", "40" },
	pin = true,
	animation = "slide left",
})
hl.window_rule({
	name = "cava-drop-right",
	match = { class = "^(waydrop-cava-right)$" },
	float = true,
	border_size = 1,
	size = { "monitor_w*0.25", "250" },
	move = { "(monitor_w)-(monitor_w*0.25)-5", "40" },
	pin = true,
	animation = "slide right",
})
hl.window_rule({
	name = "control-centre",
	match = { class = "^(waydrop-centre)$" },
	float = true,
	border_size = 1,
	size = { 550, 1100 },
	move = { "(monitor_w)-560", "40" },
	opacity = "1.0 override 1.0 override",
	pin = true,
	animation = "slide right",
})
