{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      carlito
      geist-font
      joypixels
      liberation_ttf
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
        emoji = [ "JoyPixels" ];
      };
    };
  };
  nixpkgs.config.joypixels.acceptLicense = true;
}
