{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    carlito
    geist-font
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
