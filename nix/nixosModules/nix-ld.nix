{ pkgs, ... }:
{
  # Nix LD for running non-Nix binaries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glibc
      openssl
      stdenv.cc.cc
    ];
  };
}
