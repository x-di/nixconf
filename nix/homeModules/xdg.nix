{ pkgs, ... }:
{
  # XDG portal (disabled - not imported)
  xdg = {
    portal = {
      enable = false;
      xdgOpenUsePortal = true;
      config = {
        common = {
          default = "*";
        };
      };
    };
  };
}
