{ pkgs, ... }:
{
  services.udev.packages = [ pkgs.gnome-settings-daemon ];
  services.udev.extraRules = ''
          KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
    '';
}
