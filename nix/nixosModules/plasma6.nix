# KDE Plasma 6 desktop environment configuration
{ pkgs, ... }:
{
  # KDE Plasma 6 desktop environment
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

  # KDE Connect for device integration
  programs.kdeconnect.enable = true;

  # KDE Partition Manager
  programs.partition-manager.enable = true;

  # KDE PIM (mail, calendar, contacts)
  programs.kde-pim = {
    enable = true;
    kmail = true;
    merkuro = true;
    kontact = true;
  };
}
