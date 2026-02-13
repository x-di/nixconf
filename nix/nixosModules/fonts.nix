# Fonts configuration
{ pkgs, ... }:
{
  # Fonts configuration
  fonts = {
    packages =
      (with pkgs; [
        carlito
        geist-font
        liberation_ttf
        noto-fonts
      ])
      ++ (with pkgs.nerd-fonts; [
        fira-code
        geist-mono
        jetbrains-mono
        zed-mono
      ]);
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "GeistMono Nerd Font"
          "JetBrainsMono Nerd Font"
          "FiraCode Nerd Font"
        ];
        sansSerif = [
          "Geist"
          "Noto Sans"
        ];
        serif = [
          "Geist"
          "Noto Serif"
        ];
      };
      hinting = {
        enable = true;
        autohint = true;
        style = "none";
      };
      subpixel = {
        rgba = "rgb";
      };
    };
    enableGhostscriptFonts = true;
    enableDefaultPackages = true;
  };
}
