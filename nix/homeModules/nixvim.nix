{ ... }:
{
  # Nixvim editor (disabled - not imported)
  # Note: nixvim requires the nixvim input to be available
  # This module is disabled as nixvim is not imported in the flake
  programs.neovim = {
    enable = false;
  };
}
