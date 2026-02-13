{ pkgs, ... }:
{
  # KDE Plasma 6 desktop environment configuration
  services = {
    displayManager.sddm = {
      enable = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
    };
    desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = false;
    };
  };

  # Exclude unnecessary KDE packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
    kate
    oxygen
    elisa
  ];
}
