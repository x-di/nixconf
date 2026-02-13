{ ... }:
{
  # Helix editor (disabled - not imported)
  programs.helix = {
    enable = false;
    defaultEditor = false;
    settings = {
      editor = {
        bufferline = "always";
        cursorline = true;
        cursorcolumn = true;
        line-number = "relative";
        true-color = true;
        indent-guides = {
          render = true;
          character = "┊";
          skip-levels = 0;
        };
        lsp = {
          display-messages = true;
        };
        soft-wrap = {
          enable = false;
          max-wrap = 25;
          max-indent-retain = 0;
        };
        whitespace.render = {
          space = "all";
          tab = "all";
          newline = "none";
        };
      };
      keys = {
        normal = {
          space = {
            W = ":toggle-option soft-wrap.enable";
            F = ":pipe fmt -w 79";
            A-s = ":w";
            Q = ":q";
            q = ":wq";
          };
        };
        insert = {
          up = "no_op";
          down = "no_op";
          left = "no_op";
          right = "no_op";
          pageup = "no_op";
          pagedown = "no_op";
          home = "no_op";
          end = "no_op";
        };
      };
    };
  };
}
