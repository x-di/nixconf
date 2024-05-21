{ pkgs, ... }:
{
  home.packages = with pkgs;
    with pkgs.nodePackages; [
      nixpkgs-fmt # nix
    ];
}
