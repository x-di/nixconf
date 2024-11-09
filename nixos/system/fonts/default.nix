{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      carlito
      geist-font
      # joypixels
      liberation_ttf
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      # openmoji-color
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "GeistMono"
          "JetBrainsMono"
        ];
      })
    ];
    fontconfig = {
      defaultFonts = {
        # emoji = [ "OpenMoji Color" ];
      };
    };
  };
  # nixpkgs.config.joypixels.acceptLicense = true;
}
