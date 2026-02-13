{ ... }:
{
  # AppImage support (disabled)
  programs.appimage = {
    enable = false;
    binfmt = false;
  };
}
