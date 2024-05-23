{ pkgs, ... }:
{
  services = {
    displayManager = {
      sddm = {
        enable = true;
        wayland = {
          enable = true;
          compositor = "kwin";
        };
        # package = pkgs.kdePackages.sddm;
      };
    };
    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };
  };
}
