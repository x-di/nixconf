{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    enablePlasmaBrowserIntegration = true;
  };
}
