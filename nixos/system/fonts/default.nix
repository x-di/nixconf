{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    carlito
    geist-font
    liberation_ttf
    (nerdfonts.override { fonts = [ "FiraCode" "GeistMono" "JetBrainsMono" ]; })
  ];
}
