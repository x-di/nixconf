{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_rusty";
    extraArgs = [
      # "--autopower" # scx_lavd
      # "--verbose"
    ];
  };
}
