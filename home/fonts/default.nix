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
    };
  };
}
