{ ... }:
{
  services.btrbk = {
    instances = {
      "multi" = {
        onCalendar = "*:0/10";
        settings = {
          timestamp_format = "long";
          snapshot_preserve_min = "4h";
          snapshot_preserve = "48h 14d 4w";
          volume = {
            "/home" = {
              snapshot_dir = "/mnt/data/.snapshots/home";
              subvolume = "home";
            };
            "/mnt/data/personal" = {
              snapshot_dir = "/mnt/data/.snapshots/personal";
              subvolume = "personal";
            };
            "/mnt/data/work" = {
              snapshot_dir = "/mnt/data/.snapshots/work";
              subvolume = "work";
            };
            "/mnt/data/misc" = {
              snapshot_dir = "/mnt/data/.snapshots/misc";
              subvolume = "misc";
            };
          };
        };
      };
    };
  };
  systemd.tmpfiles.rules = [
    "d /mnt/data/.snapshots 0755 root root"
    "d /mnt/data/.snapshots/home 0755 root root"
    "d /mnt/data/.snapshots/personal 0755 root root"
    "d /mnt/data/.snapshots/work 0755 root root"
    "d /mnt/data/.snapshots/misc 0755 root root"
  ];
}
