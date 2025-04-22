{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_flash";
    extraArgs = [
      "-k" # scx_flash | scx_bpfland
      # "--autopower" # scx_lavd
      # "--verbose"
    ];
  };
}
