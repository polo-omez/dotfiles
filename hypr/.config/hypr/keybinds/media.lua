hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volumeBrightness .. " volume_up"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volumeBrightness .. " volume_down"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(volumeBrightness .. " volume_mute"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(volumeBrightness .. " mic_mute"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(volumeBrightness .. " brightness_up"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(volumeBrightness .. " brightness_down"), { repeating = true })

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(volumeBrightness .. " play_pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(volumeBrightness .. " play_pause"), { locked = true })
--hl.bind("XF86AudioPlayPause", hl.dsp.exec_cmd(volumeBrightness .. " play_pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(volumeBrightness .. " next_track"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(volumeBrightness .. " prev_track"), { locked = true })

hl.bind("Print", hl.dsp.exec_cmd("~/.config/scripts/utils/screenshot.sh -r selection"))
