{ ... }:
let
  name = "xd";
  homeDirectory = "/home/xd";
  stateVersion = "24.11";
in
{
  catppuccin = {
    enable = true;
    accent = "lavender"; # Type: one of “blue”, “flamingo”, “green”, “lavender”, “maroon”, “mauve”, “peach”, “pink”, “red”, “rosewater”, “sapphire”, “sky”, “teal”, “yellow”
    flavor = "mocha"; # Type: one of “latte”, “frappe”, “macchiato”, “mocha”
  };
  home = {
    username = "${name}";
    homeDirectory = "${homeDirectory}";
    stateVersion = "${stateVersion}";
  };
  nixpkgs.config.allowUnfree = true;
  imports = [
    (import ./langserver)
    (import ./packages)
    (import ./programs)
    (import ./services)
  ];
}
