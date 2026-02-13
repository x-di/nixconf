{ ... }:
{
  # Yazi file manager (disabled)
  programs.yazi = {
    enable = false;
    settings = {
      log = {
        enabled = false;
      };
      manager = {
        ratio = [
          1
          5
          2
        ];
        show_hidden = false;
        sort_by = "alphabetical";
        linemode = "size";
        sort_dir_first = true;
        sort_reverse = false;
      };
    };
  };
}
