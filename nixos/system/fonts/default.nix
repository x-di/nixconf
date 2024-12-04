{ pkgs, ... }:
{
  fonts = {
    packages = (with pkgs; [
      carlito
      geist-font
      # joypixels
      liberation_ttf
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
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
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "GeistMono Nerd Font" ];
        sansSerif = [ "Geist" ];
        serif = [ "Geist" ];
      };
      hinting = {
        enable = true;
        autohint = true;
        style = "medium";
      };
      subpixel = {
        rgba = "rgb";
      };
    };
    enableGhostscriptFonts = true;
    enableDefaultPackages = true;
  };
  # nixpkgs.config.joypixels.acceptLicense = true;
}
