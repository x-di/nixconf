{ pkgs, ... }:
{
  services.scx = {
    enable = true;
    package = pkgs.scx_git.rustscheds;
    scheduler = "scx_lavd";
    extraArgs = [
      "--autopilot"
      "--no-freq-scaling"
    ];
  };
}
