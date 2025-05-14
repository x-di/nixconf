{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx_git.rustscheds;
    scheduler = "scx_bpfland";
    extraArgs = [
      "-s"
      "5000"
      "-S"
      "300"
      "-l"
      "5000"
      "-f" # scx_bpfland | scx_rusty
      # "-n" # scx_bpfland
      "-p" # scx_bpfland
      "-k" # scx_flash | scx_bpfland | scx_rusty
      # "--autopower" # scx_lavd
      # "--verbose"
      # "-g"
      # "1"
      # "-D"
      # "80.0"
      # "-K"
      # "100.0"
      # "-b"
      # "-k"
      # "-f"
    ];
  };
}
