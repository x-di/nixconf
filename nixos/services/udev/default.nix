{ pkgs, ... }:
{
  services.udev.packages = [ pkgs.gnome-settings-daemon ];
}
