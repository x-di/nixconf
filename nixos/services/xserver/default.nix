{ lib, pkgs, ... }:
{
  services = {
    xserver = {
      enable = lib.mkForce false;
      # xkb = {
      #   layout = "us";
      #   variant = "";
      # };
      videoDrivers = [ "modesetting" ];
      excludePackages = [
        pkgs.xterm
      ];
    };
  };
}
