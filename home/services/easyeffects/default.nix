{ pkgs, ... }:
{
  services.easyeffects = {
    enable = false;
    package = pkgs.easyeffects;
  };
}
