{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    # noto-fonts
    # cascadia-code
    # cantarell-fonts
    geist-font
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
