-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- ============================================================================
-- Migrated from the legacy input.conf (Omarchy 3 -> quattro .lua).
-- ============================================================================

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
  input = {
    -- Multiple keyboard layouts: US / German / Russian.
    kb_layout = "us,de,ru",
    -- CapsLock acts as Ctrl; switch layouts by pressing Alt+Shift together.
    kb_options = "ctrl:nocaps,grp:alt_shift_toggle",

    -- Slower key-repeat delay than the Omarchy default (250 ms -> 600 ms).
    repeat_delay = 600,
  },
})

-- Settings from input.conf that already matched the Omarchy defaults and so
-- were not carried over: repeat_rate = 40, numlock_by_default = true,
-- touchpad.scroll_factor = 0.4, and the terminal scroll_touchpad window rules.

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })
