{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
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
