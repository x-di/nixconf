{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_lavd";
    extraArgs = [
      # "--autopower" # scx_lavd
      # "--verbose"
    ];
  };
}
