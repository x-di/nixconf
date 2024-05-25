{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = false;
      xkb = {
        layout = "us";
        variant = "";
      };
      excludePackages = [
        pkgs.xterm
      ];
    };
  };
}
