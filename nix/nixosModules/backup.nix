# BTRFS backup configuration
{ ... }:
{
  # BTRFS backup configuration
  services.btrbk = {
    instances = {
      "multi" = {
        onCalendar = "*:0/30";
        settings = {
          timestamp_format = "long";
          snapshot_preserve_min = "4h";
          snapshot_preserve = "48h 14d 4w";
          volume = {
            "/home" = {
              snapshot_dir = ".snapshots";
              subvolume = "/home";
            };
            "/mnt/data/personal" = {
              snapshot_dir = ".snapshots";
              subvolume = "/mnt/data/personal";
            };
            "/mnt/data/work" = {
              snapshot_dir = ".snapshots";
              subvolume = "/mnt/data/work";
            };
            "/mnt/data/misc" = {
              snapshot_dir = ".snapshots";
              subvolume = "/mnt/data/misc";
            };
          };
        };
      };
    };
  };
}
