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
          "IBM Plex Mono"
          "ZedMono Nerd Font"
          "GeistMono Nerd Font"
          "JetBrainsMono Nerd Font"
          "FiraCode Nerd Font"
        ];
        sansSerif = [
          "IBM Plex Sans"
          "ZedMono Nerd Font"
          "Geist"
          "Noto Sans"
        ];
        serif = [
          "IBM Plex Serif"
          "ZedMono Nerd Font"
          "Geist"
          "Noto Serif"
        ];
      };
    };
  };
}
