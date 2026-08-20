-- Hand-migrated from hyprlang (hyprland.conf) to Hyprland's new Lua config (0.55+).
-- See https://wiki.hypr.land/Configuring/Start/
--
-- Ordering note: Hyprland aborts the rest of this file if a line throws a runtime
-- error (e.g. calling a dispatcher wrapper that doesn't exist). Anything important
-- (monitors, autostart, main keybinds) is placed before the one bind whose exact
-- Lua wrapper name I couldn't fully confirm (fullscreen) so a mistake there can't
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
        layout        = "scrolling", -- niri-style infinite scrolling tape of columns
    },
    -- Built-in Hyprland layout (0.55+, not a plugin) - see
    -- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
    scrolling = {
        fullscreen_on_one_column = true,  -- a single column fills the whole screen, like niri
        column_width             = 0.5,   -- default column width as a fraction of screen width
        focus_fit_method         = 1,     -- 1 = fit focused column into view (niri-like), 0 = center
        follow_focus             = true,
        follow_min_visible       = 0.4,
        explicit_column_widths   = "0.333, 0.5, 0.667, 1.0",
        wrap_focus               = false, -- niri doesn't wrap focus at the ends by default
        wrap_swapcol             = false,
        direction                = "right",
    },
})

-------------------
---- AUTOSTART ----
-------------------

--hl.on("hyprland.start", function()
--  hl.exec_cmd("dms run")
--end)

---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))

-- fullscreen dispatcher args are unchanged from hyprlang (1 = maximize, 0 = real
-- fullscreen); routed through hyprctl directly since it's guaranteed-correct
-- classic dispatcher syntax and I couldn't fully confirm the new Lua wrapper's
-- exact field names.
hl.bind(mainMod .. " + F",         hl.dsp.exec_cmd("hyprctl dispatch fullscreen 1"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("hyprctl dispatch fullscreen 0"))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-----------------------------------
---- SCROLLING LAYOUT (niri-like) ----
-----------------------------------
-- Dispatcher reference: https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- "focus"/"swapcol" take l/r/u/d: l/r move between columns, u/d move within a column.

-- Focus: arrows + vim-style hjkl
hl.bind(mainMod .. " + left",  hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + right", hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + up",    hl.dsp.layout("focus u"))
hl.bind(mainMod .. " + down",  hl.dsp.layout("focus d"))
hl.bind(mainMod .. " + H",     hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + L",     hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + K",     hl.dsp.layout("focus u"))
hl.bind(mainMod .. " + J",     hl.dsp.layout("focus d"))

-- Move the current column left/right (swap with its neighbor)
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + CTRL + H",     hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + CTRL + L",     hl.dsp.layout("swapcol r"))

-- Consume the neighboring window into the current column / expel it back out
hl.bind(mainMod .. " + bracketleft",  hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. " + bracketright", hl.dsp.layout("consume_or_expel next"))
hl.bind(mainMod .. " + comma",        hl.dsp.layout("consume"))
hl.bind(mainMod .. " + period",       hl.dsp.layout("expel"))

-- Column width: step through presets, or fine-tune by 10%
hl.bind(mainMod .. " + R",     hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + minus", hl.dsp.layout("colresize -0.1"))
hl.bind(mainMod .. " + equal", hl.dsp.layout("colresize +0.1"))

-- Expand the focused column into any free space on screen, or center it
hl.bind(mainMod .. " + CTRL + F", hl.dsp.layout("fit expand"))
hl.bind(mainMod .. " + C",        hl.dsp.layout("center"))

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

--------------------
---- SCREENSHOTS ----
--------------------

-- caelestia -> dms screenshot (region/full/window are real dms CLI subcommands,
-- no DBus global-shortcut plumbing needed like caelestia's was)
hl.bind("PRINT",               hl.dsp.exec_cmd("dms screenshot"))
hl.bind("SHIFT + PRINT",       hl.dsp.exec_cmd("dms screenshot full"))
hl.bind("SHIFT + ALT + PRINT", hl.dsp.exec_cmd("dms screenshot window"))
