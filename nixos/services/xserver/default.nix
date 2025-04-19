{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = false;
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
