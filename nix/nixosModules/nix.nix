# Nix configuration
{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Nix daemon configuration
  nix = {
    settings = {
      trusted-users = [
        "root"
        "dim"
      ];
      keep-outputs = true;
      keep-derivations = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://cache.nixos.org/"
        "https://nix-community.cachix.org"
      ];
      extra-substituters = [
        "https://devenv.cachix.org"
        "https://zed.cachix.org"
        "https://cache.garnix.io"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      extra-trusted-public-keys = [
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
        "zed.cachix.org-1:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];
      fallback = true;
      extra-sandbox-paths = lib.optional config.programs.ccache.enable config.programs.ccache.cacheDir;
      auto-optimise-store = true;
    };

    # Use Lix as nix implementation
    package = pkgs.lixPackageSets.latest.lix;

    # Automatic garbage collection
    gc = {
      automatic = true;
      dates = "Mon,Fri *-*-* 00:00:00";
      options = "--delete-older-than 3d";
    };
  };
}
