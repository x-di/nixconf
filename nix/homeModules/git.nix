{ ... }:
{
  # Git configuration
  programs.git = {
    enable = true;

    # GPG signing
    signing = {
      signByDefault = true;
      key = "11E66F143A6E166B";
    };

    settings = {
      user = {
        email = "dimasimam75@gmail.com";
        name = "x-di";
      };

      # Delta diff viewer
      delta.side-by-side = true;
    };
  };
}
