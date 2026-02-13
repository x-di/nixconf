{ ... }:
{
  # System maintenance services
  services = {
    # BTRFS scrub
    btrfs.autoScrub.enable = true;

    # Early out-of-memory killing
    earlyoom.enable = true;

    # SSD TRIM
    fstrim.enable = true;

    # Firmware updates
    fwupd.enable = true;

    # Journal size limits
    journald.extraConfig = ''
      SystemMaxUse=500M
      MaxFileSec=7day
    '';

    # Thermal management
    thermald.enable = true;

    # NTP time sync
    timesyncd.enable = true;
  };
}
