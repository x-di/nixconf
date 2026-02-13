{ pkgs, ... }:
{
  # Desktop services configuration
  services = {
    # X11 server
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    # D-Bus
    dbus.enable = true;

    # Note: android-udev-rules removed (now built into systemd uaccess)

    # GPU switching
    switcherooControl.enable = true;

    # System76 scheduler
    system76-scheduler.enable = true;
  };
}
