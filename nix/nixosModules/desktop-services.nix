# Desktop services configuration
{ pkgs, lib, ... }:
{
  services = {
    # X11 server (disabled - using Wayland)
    xserver = {
      enable = lib.mkForce false;
      videoDrivers = [ "modesetting" ];
      excludePackages = [ pkgs.xterm ];
    };

    # D-Bus
    dbus = {
      enable = true;
      implementation = "broker";
    };

    # GPU switching
    switcherooControl.enable = true;
  };
}
