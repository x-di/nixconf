{ pkgs, ... }:
{
  services.scx = {
    enable = false;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_rusty";
    extraArgs = [
      # "--autopower" # scx_lavd
      # "--verbose"
    ];
  };
}
