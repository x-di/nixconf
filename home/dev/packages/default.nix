{ pkgs, ... }:
{
  home = {
    packages = (
      with pkgs;
      [
        gcc
        nil
        nixd
        nixfmt-rfc-style
        nixpkgs-fmt
        nodejs_latest
      ]
    );
  };
}
