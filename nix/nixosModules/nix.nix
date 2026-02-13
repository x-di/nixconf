{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Nixpkgs configuration
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      # Lix tool overlay
      (final: prev: {
        inherit (prev.lixPackageSets.stable)
          nixpkgs-review
          nix-eval-jobs
          nix-fast-build
          colmena
          ;
      })
    ];
  };

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
      extra-substituters = [ "https://devenv.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      extra-trusted-public-keys = [
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
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
