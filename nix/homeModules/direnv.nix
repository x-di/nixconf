{ ... }:
{
  # Direnv environment switcher
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
