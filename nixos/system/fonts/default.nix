{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      carlito
      geist-font
      liberation_ttf
      openmoji-color
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
        emoji = [ "OpenMoji Color" ];
      };
    };
  };
}
