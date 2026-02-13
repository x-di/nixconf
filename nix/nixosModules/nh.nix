# Nix helper CLI configuration
{ ... }:
{
  # Nix helper CLI
  programs.nh = {
    enable = true;
    flake = "/home/dim/.config/nixconf";
  };
}
