-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- ============================================================================
-- Migrated from the legacy bindings.conf (Omarchy 3 -> quattro .lua).
--
-- Chords that Quattro already binds identically (Terminal, Browser, File
-- manager, Editor, Music, Docker, Signal, Obsidian, Music TUI, ...) are left
-- to the Omarchy defaults and NOT redefined here, so nothing double-fires.
-- Only unbinds and personal changes are kept below.
-- ============================================================================

-- ---- Unbind Quattro defaults the personal bindings below replace/remove ----

-- SUPER+TAB: default "Next workspace" -> replaced with cycle-next below.
hl.unbind("SUPER + TAB")
-- SUPER+P: default "Pseudo window" -> replaced with color picker below.
hl.unbind("SUPER + P")
-- SUPER+PRINT: default color picker -> removed (color picker moved to SUPER+P).
hl.unbind("SUPER + PRINT")
-- SUPER+CTRL+X: default voxtype dictation toggle -> moved to SUPER+D below.
hl.unbind("SUPER + CTRL + X")
-- F9: default voxtype push-to-talk -> removed.
hl.unbind("F9")
-- SUPER+ALT+RETURN: default "Work" tmux session -> replaced with the tmux
-- command below.
hl.unbind("SUPER + ALT + RETURN")

-- ---- Personal bindings ----

-- Cycle to the next window (replaces the default "next workspace").
o.bind("SUPER + TAB", "Next window", hl.dsp.window.cycle_next())

-- Open a new tmux session in the active terminal's directory.
o.bind("SUPER + ALT + RETURN", "Tmux", 'uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" tmux new')

-- Screenshot a region to the clipboard.
o.bind("SUPER + A", "Screenshot to clipboard", 'grim -g "$(slurp)" - | wl-copy')

-- Color picker (moved from SUPER+PRINT; SUPER+PRINT is now unbound).
o.bind("SUPER + P", "Color picker", "pkill hyprpicker || hyprpicker -a")

-- Dictation toggle (moved from SUPER+CTRL+X; F9 push-to-talk removed).
o.bind("SUPER + D", "Toggle dictation", "voxtype record toggle")

-- System monitor in the terminal (SUPER+SHIFT+T, not bound by defaults).
o.bind("SUPER + SHIFT + T", "Activity", "omarchy-launch-tui btop")

-- Note: earlier versions also bound SUPER+P / changelocale etc. via .conf.
-- Those are now here in .lua; the legacy .conf files were retired (see
-- autostart.conf, bindings.conf, etc. renamed to .conf.bak).
