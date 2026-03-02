{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flakelight = {
      url = "github:nix-community/flakelight";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zed = {
      url = "github:zed-industries/zed";
    };
    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
    };
  };

  outputs =
    { flakelight, ... }@inputs:
    flakelight ./. {
      inherit inputs;
      nixpkgs.config.allowUnfree = true;
      withOverlays = [
        inputs.self.overlays.lix
        inputs.self.overlays.zed
        inputs.nix-cachyos-kernel.overlays.pinned
      ];
      legacyPackages = pkgs: pkgs;
    };

  nixConfig.commit-lockfile-summary = "flake: Update inputs";
}
