-- Hand-migrated from hyprlang (hyprland.conf) to Hyprland's new Lua config (0.55+).
-- See https://wiki.hypr.land/Configuring/Start/
--
-- Ordering note: Hyprland aborts the rest of this file if a line throws a runtime
-- error (e.g. calling a dispatcher wrapper that doesn't exist). Anything important
-- (monitors, autostart, main keybinds) is placed before the less-certain bits
-- (the `global` DBus-shortcut dispatcher at the very end) so a mistake there can't
-- take down the rest of the session.

------------------
---- MONITORS ----
------------------

hl.monitor({ output = "DP-1", mode = "highrr", position = "auto", scale = "auto" })
hl.monitor({ output = "DP-2", mode = "highrr", position = "auto", scale = "auto" })

---------------------
---- MY PROGRAMS ----
---------------------

local mainMod     = "SUPER"
local terminal    = "ghostty"
local fileManager = "nautilus"

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        allow_tearing = true,
        gaps_in       = 4,
        gaps_out      = 8,
        border_size   = 0,
    },
})

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
  hl.exec_cmd("dms run")
end)

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + Enter", hl.dsp.exec_cmd(terminal))

-- fullscreen dispatcher args are unchanged from hyprlang (1 = maximize, 0 = real
-- fullscreen); routed through hyprctl directly since it's guaranteed-correct
-- classic dispatcher syntax and I couldn't fully confirm the new Lua wrapper's
-- exact field names.
hl.bind(mainMod .. " + F",         hl.dsp.exec_cmd("hyprctl dispatch fullscreen 1"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("hyprctl dispatch fullscreen 0"))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Switch workspaces with mainMod + [0-9], move active window with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mainMod + LMB/RMB drag
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume / brightness / mic keys: locked (work on lockscreen) + repeating
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5"),                    { locked = true, repeating = true })

------------------------------------------------
---- SCREENSHOTS (uses the `global` dispatcher, kept last on purpose) ----
------------------------------------------------

hl.bind("PRINT",               hl.dsp.exec_cmd("caelestia screenshot"))
hl.bind("SHIFT + PRINT",       hl.dsp.global("caelestia:screenshotFreeze"))
hl.bind("SHIFT + ALT + PRINT", hl.dsp.global("caelestia:screenshot"))
