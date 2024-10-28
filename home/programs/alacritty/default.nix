{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = "fish";
      font = {
        normal = {
          family = "GeistMono NF";
          style = "Regular";
        };
        bold = {
          family = "GeistMono NF";
          style = "Bold";
        };
        italic = {
          family = "GeistMono NF";
          style = "Italic";
        };
        bold_italic = {
          family = "GeistMono NF";
          style = "Bold Italic";
        };
        size = 14;
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      window = {
        dimensions = {
          lines = 0;
          columns = 0;
        };
        padding = {
          x = 10;
          y = 10;
        };
        decorations = "Full";
        blur = false;
        opacity = 1.0;
        startup_mode = "Maximized";
      };
      cursor = {
        style = {
          shape = "Beam";
          blinking = "Always";
        };
        vi_mode_style = {
          shape = "Beam";
          blinking = "Always";
        };
      };
      colors = {
        primary = {
          # hard contrast background = = '#1d2021'
          # default background = = '#282828'
          # soft contrast background = = '#32302f'
          background = "#282828";
          foreground = "#ebdbb2";
        };
        normal = {
          black = "#282828";
          red = "#cc241d";
          green = "#98971a";
          yellow = "#d79921";
          blue = "#458588";
          magenta = "#b16286";
          cyan = "#689d6a";
          white = "#a89984";
        };
        bright = {
          black = "#928374";
          red = "#fb4934";
          green = "#b8bb26";
          yellow = "#fabd2f";
          blue = "#83a598";
          magenta = "#d3869b";
          cyan = "#8ec07c";
          white = "#ebdbb2";
        };
      };
    };
  };
}
