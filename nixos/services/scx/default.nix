{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx.rustscheds;
    scheduler = "scx_flash";
    extraArgs = [
      "-f"
      "-p"
      "-k"
    ];
  };
}
