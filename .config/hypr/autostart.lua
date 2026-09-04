-- Extra autostart processes.

-- Migrated from the legacy autostart.conf (Omarchy 3 -> quattro .lua):
-- Walker launcher running as a background GApplication service.
o.launch_on_start("walker --gapplication-service")
