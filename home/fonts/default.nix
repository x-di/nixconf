{ ... }:
{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [
          "JoyPixels"
          "Noto Color Emoji"
        ];
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
    };
  };
}
