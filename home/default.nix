{ ... }:
let
  name = "dim";
  homeDirectory = "/home/dim";
  stateVersion = "25.05";
in
{
  # catppuccin = {
  #   enable = false;
  #   accent = "flamingo"; # Type: one of “blue”, “flamingo”, “green”, “lavender”, “maroon”, “mauve”, “peach”, “pink”, “red”, “rosewater”, “sapphire”, “sky”, “teal”, “yellow”
  #   flavor = "mocha"; # Type: one of “latte”, “frappe”, “macchiato”, “mocha”
  # };
  home = {
    username = "${name}";
    homeDirectory = "${homeDirectory}";
    stateVersion = "${stateVersion}";
  };
  nixpkgs.config.allowUnfree = true;
  imports = [
    (import ./dev)
    (import ./langserver)
    (import ./packages)
    (import ./programs)
    (import ./services)
  ];
}
