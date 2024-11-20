{pkgs, ...}:
{
  services.system76-scheduler = {
    enable = true;
    package = pkgs.linuxPackages_lqx.system76-scheduler;
  };
  hardware.system76.enableAll = true;
  hardware.system76.firmware-daemon.enable = false;
}
