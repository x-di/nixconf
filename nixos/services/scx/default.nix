{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_bpfland";
    extraArgs = [
      "-f" # scx_bpfland | scx_rusty
      # "-n" # scx_bpfland
      "-p" # scx_bpfland
      "-k" # scx_flash | scx_bpfland | scx_rusty
      # "--autopower" # scx_lavd
      # "--verbose"
    ];
  };
}
