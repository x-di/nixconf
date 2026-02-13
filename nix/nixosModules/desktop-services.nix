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

    # Udev rules for Android devices
    udev.packages = with pkgs; [ android-udev-rules ];

    # GPU switching
    switcherooControl.enable = true;

    # System76 scheduler
    system76-scheduler.enable = true;
  };
}
