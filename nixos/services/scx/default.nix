{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx_git.rustscheds;
    scheduler = "scx_flash";
    extraArgs = [
      "-k"
    ];
  };
}
