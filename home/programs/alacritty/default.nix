{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      shell = "fish";
      font = {
        normal = {
          family = "GeistMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "GeistMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "GeistMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "GeistMono Nerd Font";
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
    };
  };
}
