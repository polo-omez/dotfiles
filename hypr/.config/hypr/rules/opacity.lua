hl.window_rule({
	match = { class = "^(hyprswitch|thunar|code|cursor|kiro-url-handler)$" },
	opacity = opacityFloat .. " " .. opacityFloat,
})

local solidClasses = {
	{ name = "browser", class = "^(zen-browser|firefox|google-chrome|zen|helium)$" },
	{ name = "okular", class = "^(org.kde.okular)$" },
	{ name = "openboard", class = "^(org.oe-f.openboard)$" },
	{ name = "gimp", class = "^(gimp)$" },
	{ name = "office", class = "^(ONLYOFFICE|libreoffice-writer)$" },
	{ name = "jmeter", class = "^(Apache JMeter)$" },
}

for _, item in ipairs(solidClasses) do
	hl.window_rule({
		name = item.name .. "-force-solid",
		match = { class = item.class },
		opacity = "1.0 override 1.0 override",
		no_dim = true,
	})
end

hl.window_rule({
	name = "youtube-force-transparent",
	match = { class = "^(com.github.th_ch.youtube_music)$" },
	opacity = "0.8 override 0.75 override",
})
hl.window_rule({
	name = "monkeytype-focus",
	match = { class = "^(zen|zen-browser)$", title = "^(Monkeytype.*)$" },
	opacity = "0.95 override 0.95 override",
})
