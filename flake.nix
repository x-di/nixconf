{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { flakelight, ... }@inputs:
    let
      zed-overlay = final: prev: {
        zed-editor = inputs.zed.packages.${final.system}.default;
      };
    in
    flakelight ./. {
      inherit inputs;
      nixpkgs.config.allowUnfree = true;
      withOverlays = [
        inputs.self.overlays.lix
        zed-overlay
      ];
      legacyPackages = pkgs: pkgs;
    };

  nixConfig.commit-lockfile-summary = "flake: Update inputs";
}
