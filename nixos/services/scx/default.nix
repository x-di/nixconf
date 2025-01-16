{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_flash";
    extraArgs = [
      # "--slice-us-max 3000"
      # "--verbose"
    ];
  };
}
