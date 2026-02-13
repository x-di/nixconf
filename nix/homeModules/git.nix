{ ... }:
{
  # Git configuration
  programs.git = {
    enable = true;
    signing = {
      signByDefault = true;
      key = "11E66F143A6E166B";
    };
    settings = {
      user = {
        email = "dimasimam75@gmail.com";
        name = "x-di";
      };
      delta.side-by-side = true;
    };
  };
}
