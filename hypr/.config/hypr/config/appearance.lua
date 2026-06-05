hl.config({
	general = {
		border_size = borderSize,
		gaps_in = gapsIn,
		gaps_out = gapsOut,
		resize_on_border = true,
		no_focus_fallback = true,
		allow_tearing = false,
		layout = "dwindle",
		col = {
			active_border = "rgb(616161)",
			inactive_border = "rgb(414141)",
		},

		snap = {
			enabled = true,
		},
	},

	decoration = {
		rounding = rounding,
		active_opacity = opacityActive,
		inactive_opacity = opacityInactive,
		dim_special = opacitySpecial,

		blur = {
			enabled = true,
			xray = true,
			special = false,
			new_optimizations = true,
			size = 7,
			brightness = 1,
			noise = 0.05,
			contrast = 0.89,
			vibrancy = 0.5,
			vibrancy_darkness = 0.5,
			popups = false,
			popups_ignorealpha = 0.6,
			input_methods = true,
			input_methods_ignorealpha = 0.8,
		},

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
	},

	misc = {
		force_default_wallpaper = 0,
		font_family = fontFamily,
		vrr = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
		key_press_enables_dpms = true,
		animate_manual_resizes = false,
		animate_mouse_windowdragging = false,
		enable_swallow = false,
		swallow_regex = "(kitty|allacritty|Alacritty)",
		allow_session_lock_restore = true,
		initial_workspace_tracking = 1,
		focus_on_activate = true,
	},

	cursor = {
		warp_on_change_workspace = 1,
	},
})
