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
      enable = false;
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
    thermald.enable = lib.mkDefault false;

    throttled = {
      enable = lib.mkDefault true;
      extraConfig = ''
        [GENERAL]
        Enabled: True
        Autoreload: True

        [UNDERVOLT]
        CORE: -105
        GPU: -85
        CACHE: -105
        UNCORE: -85
        ANALOGIO: 0

        [AC]
        Update_Rate_s: 5
        PL1_Tdp_W: 44
        PL2_Tdp_W: 44
        Trip_Temp_C: 89

        [BATTERY]
        Update_Rate_s: 30
        PL1_Tdp_W: 29
        PL2_Tdp_W: 44
        Trip_Temp_C: 85
      '';
    };

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
