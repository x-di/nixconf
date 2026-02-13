{ pkgs, ... }:
{
  # Chromium browser with Plasma integration
  programs.chromium = {
    enable = true;
    enablePlasmaBrowserIntegration = true;
  };
}
