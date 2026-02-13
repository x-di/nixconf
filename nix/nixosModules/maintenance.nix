# System maintenance services
{ lib, ... }:
{
  services = {
    # BTRFS scrub
    btrfs.autoScrub = {
      enable = true;
      interval = "weekly";
      fileSystems = [
        "/"
        "/mnt/data"
      ];
    };

    # Early out-of-memory killing
    earlyoom = {
      enable = true;
      freeMemThreshold = 5;
    };

    # SSD TRIM
    fstrim.enable = lib.mkDefault true;

    # Firmware updates
    fwupd.enable = lib.mkDefault true;

    # Journal size limits
    journald.extraConfig = ''
      SystemMaxUse=50M
    '';

    # Thermal management
    thermald.enable = lib.mkDefault true;

    # NTP time sync
    timesyncd = {
      enable = true;
      servers = [ "time.cloudflare.com" ];
      fallbackServers = [
        "time.google.com"
        "0.arch.pool.ntp.org"
        "1.arch.pool.ntp.org"
        "2.arch.pool.ntp.org"
        "3.arch.pool.ntp.org"
      ];
    };
  };
}
