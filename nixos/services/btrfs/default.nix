{ ... }:
{
  services.btrfs = {
    autoScrub = {
      enable = true;
      interval = "weekly";
      fileSystems = [
        "/"
        "/mnt/data"
      ];
    };
  };
}
