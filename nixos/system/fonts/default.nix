{ pkgs, ... }:
{
  fonts = {
    packages =
      (with pkgs; [
        carlito
        geist-font
        joypixels
        liberation_ttf
        noto-fonts
        # noto-fonts-cjk-sans
        # noto-fonts-cjk-serif
        # noto-fonts-color-emoji
        # openmoji-color
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
        emoji = [
          "JoyPixels"
          "Noto Color Emoji"
        ];
        monospace = [
          "ZedMono Nerd Font"
          "GeistMono Nerd Font"
          "JetBrainsMono Nerd Font"
          "FiraCode Nerd Font"
        ];
        sansSerif = [
          "ZedMono Nerd Font"
          "Geist"
          "Noto Sans"
        ];
        serif = [
          "ZedMono Nerd Font"
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
      # allowBitmaps = true;
      # useEmbeddedBitmaps = true;
    };
    enableGhostscriptFonts = true;
    enableDefaultPackages = true;
    # fontDir = {
    #   enable = true;
    #   decompressFonts = true;
    # };
  };
  nixpkgs.config.joypixels.acceptLicense = true;
}
