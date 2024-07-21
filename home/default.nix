{ ... }:
let
  name = "dim";
  homeDirectory = "/home/dim";
  stateVersion = "24.11";
in
{
  catppuccin = {
    enable = true;
    accent = "mauve"; # Type: one of “blue”, “flamingo”, “green”, “lavender”, “maroon”, “mauve”, “peach”, “pink”, “red”, “rosewater”, “sapphire”, “sky”, “teal”, “yellow”
    flavor = "mocha"; # Type: one of “latte”, “frappe”, “macchiato”, “mocha”
  };
  home = {
    username = "${name}";
    homeDirectory = "${homeDirectory}";
    stateVersion = "${stateVersion}";
  };
  nixpkgs.config.allowUnfree = true;
  imports = [
    #(import ./langserver)
    (import ./packages)
    (import ./programs)
    (import ./services)
  ];
}
