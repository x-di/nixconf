{ ... }:
let
  name = "xd";
  homeDirectory = "/home/xd";
  stateVersion = "24.11";
in
{
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
