{ config, lib, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
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
        # "https://cache.komunix.org/"
        "https://nix-community.cachix.org"
        # "https://chaotic-nyx.cachix.org"
      ];
      extra-substituters = [
        "https://devenv.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        # "chaotic-nyx.cachix.org-1:HfnXSw4pj95iI/n17rIDy40agHj12WfF+Gqk6SonIT8="
      ];
      extra-trusted-public-keys = [
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];
      fallback = true;
      extra-sandbox-paths = lib.optional config.programs.ccache.enable config.programs.ccache.cacheDir;
      auto-optimise-store = true;
    };
    # package = pkgs.lix;
  };
}
