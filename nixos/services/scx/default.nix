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
      "500"
      "-l"
      "5000"
      "-p"
      "-k"
    ];
  };
}
