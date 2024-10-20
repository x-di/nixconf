{ pkgs, ... }:
{
  services.kdeconnect = {
    enable = true;
    indicator = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
