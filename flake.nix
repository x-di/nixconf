{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # catppuccin.url = "github:catppuccin/nix";
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      # nixvim,
      # catppuccin,
      chaotic,
      lix-module,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      lib = nixpkgs.lib;
    in
    rec {
      inputs.pkgs = pkgs;
      nixosConfigurations.nixos = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware-configuration.nix
          ./nixos
          # catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          chaotic.nixosModules.default # OUR DEFAULT MODULE
          lix-module.nixosModules.default
          {
            # catppuccin = {
            #   enable = false;
            #   accent = "flamingo"; # Type: one of “blue”, “flamingo”, “green”, “lavender”, “maroon”, “mauve”, “peach”, “pink”, “red”, “rosewater”, “sapphire”, “sky”, “teal”, “yellow”
            #   flavor = "mocha"; # Type: one of “latte”, “frappe”, “macchiato”, “mocha”
            # };
            home-manager.backupFileExtension = ".backup"; # remove duplicates from ~/.config/fontconfig/conf.d/
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [
              # nixvim.homeManagerModules.nixvim
              # catppuccin.homeManagerModules.catppuccin
            ];
            home-manager.users.dim = (import ./home inputs);
            environment.systemPackages = (import ./nixos/packages inputs).packages;
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
              };
              # package = pkgs.lix;
            };
          }
        ];
      };
    };
}
