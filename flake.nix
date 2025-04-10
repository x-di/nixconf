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
    # chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    # lix-module = {
    #   url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # lanzaboote = {
    #   url = "github:nix-community/lanzaboote/v0.4.2";

    #   # Optional but recommended to limit the size of your system closure.
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      # nixvim,
      # catppuccin,
      # chaotic,
      # lix-module,
      # lanzaboote,
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
      nixosConfigurations.nixos-81B0 = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hardware-configuration.nix
          ./nixos
          # catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          # chaotic.nixosModules.default # OUR DEFAULT MODULE
          # lix-module.nixosModules.default
          # lanzaboote.nixosModules.lanzaboote
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
          }
        ];
      };
    };
}
