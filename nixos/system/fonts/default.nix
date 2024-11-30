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
      defaultFonts = {
        # emoji = [ "OpenMoji Color" ];
      };
    };
  };
  # nixpkgs.config.joypixels.acceptLicense = true;
}
