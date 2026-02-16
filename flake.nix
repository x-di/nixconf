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
      ];
      legacyPackages = pkgs: pkgs;
    };

  nixConfig.commit-lockfile-summary = "flake: Update inputs";
}
