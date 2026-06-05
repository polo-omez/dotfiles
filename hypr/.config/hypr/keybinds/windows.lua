hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind("ALT + F4", hl.dsp.window.kill())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- FOCUS
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

-- MOVEMENT
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- HYPRTASKING MOVE
--hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd("hyprctl dispatch hyprtasking:movewindow left"))
--hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprctl dispatch hyprtasking:movewindow right"))
--hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd("hyprctl dispatch hyprtasking:movewindow up"))
--hl.bind(mainMod .. " + SHIFT + J", hl.dsp.exec_cmd("hyprctl dispatch hyprtasking:movewindow down"))

-- SWAP
hl.bind(mainMod .. " + CONTROL + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + CONTROL + L", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. " + CONTROL + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + CONTROL + J", hl.dsp.window.swap({ direction = "d" }))

-- RESIZE SUBMAP
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
	hl.bind("H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

	hl.bind("escape", hl.dsp.submap("reset"))
	hl.bind(mainMod .. " + R", hl.dsp.submap("reset"))
end)
