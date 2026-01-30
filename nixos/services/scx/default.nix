{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_flash";
    extraArgs = [
      "-p"
      "-k"
      "-m"
      "performance"
      "-w"
      "-C"
      "0"
    ];
  };
}
