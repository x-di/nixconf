{ pkgs, ... }:
{
  programs.chromium = {
    enable = false;
    package = pkgs.brave;
  };
}
