{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_rusty";
    extraArgs = [
      # "-f" # scx_bpfland | scx_rusty
      # "-n" # scx_bpfland
      # "-p" # scx_bpfland
      # "-k" # scx_flash | scx_bpfland | scx_rusty
      # "--autopower" # scx_lavd
      # "--verbose"
      "-g"
      "1"
      "-D"
      "80.0"
      "-K"
      "100.0"
      "-b"
      "-k"
      "-f"
    ];
  };
}
