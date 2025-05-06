{ pkgs, ... }:
{
  services.lorri = {
    enable = true;
    enableNotifications = true;
    # nixPackage = pkgs.lix;
    package = pkgs.lorri;
  };
}
