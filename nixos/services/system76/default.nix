{ pkgs, ... }:
{
  services.system76-scheduler = {
    enable = true;
    package = pkgs.system76-scheduler;
  };
  hardware.system76.enableAll = true;
  hardware.system76.firmware-daemon.enable = false;
}
